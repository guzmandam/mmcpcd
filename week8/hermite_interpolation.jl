"""
    hermite_interpolation(x::Vector{T}, fx::Vector{T}, dfx::Vector{T}) where T <: Number

Compute the coefficients of the Hermite interpolating polynomial H(x).

# Arguments
- `x::Vector{T}`: Vector of x coordinates (nodes)
- `fx::Vector{T}`: Vector of function values f(x)
- `dfx::Vector{T}`: Vector of derivative values f'(x)

# Returns
- `Q::Matrix{T}`: Matrix containing the divided differences
- `z::Vector{T}`: Vector of duplicated x values used in the algorithm

# Description
Implements Algorithm 3.3 (Hermite Interpolation) to construct an interpolating
polynomial that matches both function values and derivatives at given points.
"""
function hermite_interpolation(x::Vector{T}, fx::Vector{T}, dfx::Vector{T}) where T <: Number
    n = length(x)
    if n != length(fx) || n != length(dfx)
        throw(ArgumentError("Input vectors must have the same length"))
    end
    
    # Initialize z and Q arrays
    z = zeros(T, 2n)
    Q = zeros(T, 2n, 2n)
    
    # Step 1 & 2: Initialize z and Q arrays
    for i in 0:(n-1)
        z[2i + 1] = x[i + 1]
        z[2i + 2] = x[i + 1]
        Q[2i + 1, 1] = fx[i + 1]
        Q[2i + 2, 1] = fx[i + 1]
        Q[2i + 2, 2] = dfx[i + 1]
        if i > 0
            Q[2i + 1, 2] = (Q[2i + 1, 1] - Q[2i, 1]) / (z[2i + 1] - z[2i])
        end
    end
    
    # Steps 3 & 4: Complete the divided difference table
    for i in 2:(2n-1)
        for j in 2:i
            if Q[i+1, j] == 0  # Only compute if not already set
                Q[i+1, j+1] = (Q[i+1, j] - Q[i, j]) / (z[i+1] - z[i-j+1])
            end
        end
    end
    
    return Q, z
end

"""
    evaluate_hermite_polynomial(Q::Matrix{T}, z::Vector{T}, t::T) where T <: Number

Evaluate the Hermite interpolation polynomial at point t.

# Arguments
- `Q::Matrix{T}`: Matrix of divided differences
- `z::Vector{T}`: Vector of duplicated x values
- `t::T`: Point at which to evaluate the polynomial

# Returns
- Value of the Hermite interpolation polynomial at point t
"""
function evaluate_hermite_polynomial(Q::Matrix{T}, z::Vector{T}, t::T) where T <: Number
    n = length(z)
    result = Q[1, 1]
    product = one(T)
    
    for i in 1:(n-1)
        product *= (t - z[i])
        result += Q[i+1, i+1] * product
    end
    
    return result
end

"""
    solve_hermite_problem(x::Vector{T}, fx::Vector{T}, dfx::Vector{T}, description::String="") where T <: Number

Solve a Hermite interpolation problem and display the results.

# Arguments
- `x::Vector{T}`: Vector of x coordinates
- `fx::Vector{T}`: Vector of function values
- `dfx::Vector{T}`: Vector of derivative values
- `description::String`: Optional problem description
"""
function solve_hermite_problem(x::Vector{T}, fx::Vector{T}, dfx::Vector{T}, description::String="") where T <: Number
    println("\nSolving Hermite Interpolation Problem: ", description)
    println("Input data:")
    println("x\t\tf(x)\t\tf'(x)")
    for i in 1:length(x)
        println("$(x[i])\t\t$(fx[i])\t\t$(dfx[i])")
    end
    
    Q, z = hermite_interpolation(x, fx, dfx)
    
    println("\nDivided Differences Table Q:")
    display(Q)
    
    println("\nInterpolating polynomial constructed successfully.")
    println("First few coefficients of H(x):")
    for i in 1:min(5, size(Q, 1))
        println("Q[$i,$(i)] = $(Q[i,i])")
    end
end

# Example problems from the textbook
function solve_example_problems()
    # Problem 1.a
    println("\n=== Problem 1.a ===")
    x1a = [8.3, 8.6]
    fx1a = [17.56492, 18.50515]
    dfx1a = [3.116256, 3.151762]
    solve_hermite_problem(x1a, fx1a, dfx1a, "Problem 1.a")
    
    # Problem 1.b
    println("\n=== Problem 1.b ===")
    x1b = [0.8, 1.0]
    fx1b = [0.22363362, 0.65809197]
    dfx1b = [2.1691753, 2.0466965]
    solve_hermite_problem(x1b, fx1b, dfx1b, "Problem 1.b")
end

# Run the example problems if the file is executed directly
if abspath(PROGRAM_FILE) == @__FILE__
    solve_example_problems()
end