"""
    natural_cubic_spline(x::Vector{T}, y::Vector{T}) where T <: Number

Construct a natural cubic spline interpolant S(x) for the function f.

# Arguments
- `x::Vector{T}`: Vector of x coordinates (knots), must be in ascending order
- `y::Vector{T}`: Vector of y coordinates (function values)

# Returns
- Dictionary containing:
  - `a`, `b`, `c`, `d`: Coefficients for each spline segment
  - `h`: Step sizes
  
# Description
Implements Algorithm 3.4 to construct a natural cubic spline with:
S(x) = ai + bi(x - xi) + ci(x - xi)² + di(x - xi)³ for xi ≤ x ≤ xi+1
satisfying S''(x₀) = S''(xₙ) = 0 (natural spline condition)
"""
function natural_cubic_spline(x::Vector{T}, y::Vector{T}) where T <: Number
    n = length(x) - 1  # n intervals, n+1 points
    
    if length(y) != n + 1
        throw(ArgumentError("Input vectors must have the same length"))
    end
    if !issorted(x)
        throw(ArgumentError("x coordinates must be in ascending order"))
    end
    
    # Step 1: Calculate step sizes h
    h = diff(x)
    
    # Step 2: Calculate α coefficients
    α = zeros(T, n-1)
    for i in 2:n
        α[i-1] = 3/h[i]*(y[i+1] - y[i]) - 3/h[i-1]*(y[i] - y[i-1])
    end
    
    # Steps 3-5: Initialize variables for tridiagonal system
    l = ones(T, n+1)
    μ = zeros(T, n+1)
    z = zeros(T, n+1)
    
    # Step 4: Forward elimination
    for i in 2:n
        l[i] = 2*(x[i+1] - x[i-1]) - h[i-1]*μ[i-1]
        μ[i] = h[i]/l[i]
        z[i] = (α[i-1] - h[i-1]*z[i-1])/l[i]
    end
    
    # Step 5: Initialize last values
    l[n+1] = 1
    z[n+1] = 0
    c = zeros(T, n+1)
    
    # Step 6: Back substitution
    b = zeros(T, n)
    d = zeros(T, n)
    for j in n:-1:1
        c[j] = z[j] - μ[j]*c[j+1]
        b[j] = (y[j+1] - y[j])/h[j] - h[j]*(c[j+1] + 2*c[j])/3
        d[j] = (c[j+1] - c[j])/(3*h[j])
    end
    
    return Dict(
        "a" => y[1:n],  # ai coefficients
        "b" => b,       # bi coefficients
        "c" => c[1:n],  # ci coefficients
        "d" => d,       # di coefficients
        "h" => h        # step sizes
    )
end

"""
    evaluate_spline(coeffs::Dict, x::Vector{T}, t::T) where T <: Number

Evaluate the cubic spline at point t.

# Arguments
- `coeffs::Dict`: Coefficients returned by natural_cubic_spline
- `x::Vector{T}`: Original x coordinates
- `t::T`: Point at which to evaluate the spline

# Returns
- Value of the spline at point t
"""
function evaluate_spline(coeffs::Dict, x::Vector{T}, t::T) where T <: Number
    # Find the appropriate interval
    i = findfirst(xi -> xi > t, x) 
    if i === nothing || i == 1
        i = length(x)
    else
        i -= 1
    end
    
    # Calculate relative x value
    dx = t - x[i]
    
    # Evaluate using Horner's method
    return coeffs["a"][i] + dx*(coeffs["b"][i] + dx*(coeffs["c"][i] + dx*coeffs["d"][i]))
end

"""
    print_spline_equations(coeffs::Dict, x::Vector{T}) where T <: Number

Print the equations for each spline segment.
"""
function print_spline_equations(coeffs::Dict, x::Vector{T}) where T <: Number
    println("\nSpline equations for each interval:")
    for i in 1:length(coeffs["a"])
        println("\nFor x in [$(x[i]), $(x[i+1])]:")
        println("S(x) = $(round(coeffs["a"][i], digits=6)) + ")
        println("      $(round(coeffs["b"][i], digits=6))(x - $(x[i])) + ")
        println("      $(round(coeffs["c"][i], digits=6))(x - $(x[i]))² + ")
        println("      $(round(coeffs["d"][i], digits=6))(x - $(x[i]))³")
    end
end

# Solve the example problem
function solve_example_problem()
    println("Solving Natural Cubic Spline interpolation for:")
    println("f(0) = 0, f(1) = 1, f(2) = 2")
    
    # Input data
    x = [0.0, 1.0, 2.0]
    y = [0.0, 1.0, 2.0]
    
    # Calculate spline coefficients
    coeffs = natural_cubic_spline(x, y)
    
    # Print the spline equations
    print_spline_equations(coeffs, x)
    
    # Evaluate at some intermediate points
    println("\nEvaluating spline at some intermediate points:")
    test_points = [0.25, 0.5, 0.75, 1.25, 1.5, 1.75]
    for t in test_points
        val = evaluate_spline(coeffs, x, t)
        println("S($t) = $val")
    end
    
    return coeffs
end

# Run the example if the file is executed directly
if abspath(PROGRAM_FILE) == @__FILE__
    coeffs = solve_example_problem()
end