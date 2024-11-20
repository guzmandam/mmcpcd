"""
    newton_divided_difference(x::Vector{T}, y::Vector{T}) where T <: Number

Compute the coefficients of Newton's divided difference interpolation polynomial.

# Arguments
- `x::Vector{T}`: Vector of x coordinates (abscissas)
- `y::Vector{T}`: Vector of y coordinates (ordinates)

# Returns
- `F::Matrix{T}`: Matrix containing the divided differences
- `coeffs::Vector{T}`: Coefficients of the Newton form of the interpolation polynomial

# Description
This function implements Newton's divided difference formula to compute the
coefficients of the interpolation polynomial. The polynomial can be evaluated
using these coefficients with the `evaluate_newton_polynomial` function.

# Example
```julia
# Define data points
x = [-1.0, 0.0, 2.0]
y = [4.0, 1.0, -1.0]

# Compute divided differences and coefficients
F, coeffs = newton_divided_difference(x, y)

# Create a function to evaluate the polynomial at any point
t = range(-1, 2, length=100)
y_interp = [evaluate_newton_polynomial(coeffs, x, ti) for ti in t]
```
"""
function newton_divided_difference(x::Vector{T}, y::Vector{T}) where T <: Number
    n = length(x)
    if n != length(y)
        throw(ArgumentError("Input vectors must have the same length"))
    end
    
    # Initialize the divided difference table
    F = zeros(T, n, n)
    
    # Fill in the first column with y values
    F[:, 1] = y
    
    # Compute divided differences
    for j in 2:n
        for i in j:n
            F[i, j] = (F[i, j-1] - F[i-1, j-1]) / (x[i] - x[i-j+1])
        end
    end
    
    # Extract coefficients (these are the first elements of each column)
    coeffs = [F[i, i] for i in 1:n]
    
    return F, coeffs
end

"""
    evaluate_newton_polynomial(coeffs::Vector{T}, x::Vector{T}, t::T) where T <: Number

Evaluate the Newton form of the interpolation polynomial at a given point.

# Arguments
- `coeffs::Vector{T}`: Coefficients of the Newton polynomial
- `x::Vector{T}`: Original x coordinates used to compute the coefficients
- `t::T`: Point at which to evaluate the polynomial

# Returns
- Value of the interpolation polynomial at point t

# Example
```julia
x = [-1.0, 0.0, 2.0]
y = [4.0, 1.0, -1.0]
F, coeffs = newton_divided_difference(x, y)
value = evaluate_newton_polynomial(coeffs, x, 0.5)
```
"""
function evaluate_newton_polynomial(coeffs::Vector{T}, x::Vector{T}, t::T) where T <: Number
    n = length(coeffs)
    result = coeffs[n]
    
    for i in (n-1):-1:1
        result = result * (t - x[i]) + coeffs[i]
    end
    
    return result
end


"""
    construct_interpolating_polynomials(x::Vector{T}, y::Vector{T}, eval_point::T) where T <: Number

Constructs interpolating polynomials of degrees 1, 2, and 3 using Newton's divided difference formula
and evaluates them at a specified point.

# Arguments
- `x::Vector{T}`: Vector of x coordinates
- `y::Vector{T}`: Vector of y coordinates
- `eval_point::T`: Point at which to evaluate the polynomials

# Returns
- Tuple containing evaluations of linear, quadratic, and cubic interpolations
"""
function construct_interpolating_polynomials(x::Vector{T}, y::Vector{T}, eval_point::T) where T <: Number
    n = length(x)
    if n < 4
        throw(ArgumentError("Need at least 4 points for cubic interpolation"))
    end
    
    # Results for different degree polynomials
    results = Dict{String, T}()
    
    # For each degree (1, 2, 3)
    for degree in 1:3
        # Use degree + 1 points for interpolation
        points_to_use = degree + 1
        
        # Find the closest points to eval_point
        distances = abs.(x .- eval_point)
        sorted_indices = sortperm(distances)
        selected_indices = sorted_indices[1:points_to_use]
        
        # Extract selected points
        x_selected = x[selected_indices]
        y_selected = y[selected_indices]
        
        # Sort points by x value
        sort_idx = sortperm(x_selected)
        x_selected = x_selected[sort_idx]
        y_selected = y_selected[sort_idx]
        
        # Compute divided differences and evaluate
        F, coeffs = newton_divided_difference(x_selected, y_selected)
        value = evaluate_newton_polynomial(coeffs, x_selected, eval_point)
        
        results["degree_$degree"] = value
    end
    
    return results
end

"""
    solve_interpolation_problem(problem_data::Dict)

Solves an interpolation problem with the given data and evaluation point.

# Arguments
- `problem_data`: Dictionary containing:
  - `x`: x-coordinates
  - `y`: y-coordinates
  - `eval_point`: Point to evaluate
  - `description`: Problem description (optional)

# Example
```julia
data = Dict(
    "x" => [8.1, 8.3, 8.6, 8.7],
    "y" => [16.94410, 17.56492, 18.50515, 18.82091],
    "eval_point" => 8.4,
    "description" => "Problem 1.a"
)
results = solve_interpolation_problem(data)
```
"""
function solve_interpolation_problem(problem_data::Dict)
    x = convert(Vector{Float64}, problem_data["x"])
    y = convert(Vector{Float64}, problem_data["y"])
    eval_point = convert(Float64, problem_data["eval_point"])
    
    results = construct_interpolating_polynomials(x, y, eval_point)
    
    # Print results
    if haskey(problem_data, "description")
        println("\nResults for ", problem_data["description"])
    end
    println("Evaluation point: ", eval_point)
    println("Linear interpolation: ", results["degree_1"])
    println("Quadratic interpolation: ", results["degree_2"])
    println("Cubic interpolation: ", results["degree_3"])
    
    return results
end

# Example usage with the given problems
function solve_example_problems()
    # Problem 1.a
    problem1a = Dict(
        "x" => [8.1, 8.3, 8.6, 8.7],
        "y" => [16.94410, 17.56492, 18.50515, 18.82091],
        "eval_point" => 8.4,
        "description" => "Problem 1.a: f(8.4)"
    )
    
    # Problem 1.b
    problem1b = Dict(
        "x" => [0.6, 0.7, 0.8, 1.0],
        "y" => [-0.17694460, 0.01375227, 0.22363362, 0.65809197],
        "eval_point" => 0.9,
        "description" => "Problem 1.b: f(0.9)"
    )
    
    # Problem 2.a
    problem2a = Dict(
        "x" => [0.0, 0.25, 0.5, 0.75],
        "y" => [1.0, 1.64872, 2.71828, 4.48169],
        "eval_point" => 0.43,
        "description" => "Problem 2.a: f(0.43)"
    )
    
    # Problem 2.b
    problem2b = Dict(
        "x" => [-0.5, -0.25, 0.25, 0.5],
        "y" => [1.93750, 1.33203, 0.800781, 0.687500],
        "eval_point" => 0.0,
        "description" => "Problem 2.b: f(0)"
    )
    
    # Solve all problems
    results = Dict()
    for problem in [problem1a, problem1b, problem2a, problem2b]
        results[problem["description"]] = solve_interpolation_problem(problem)
    end
    
    return results
end

# Run the examples if the file is executed directly
if abspath(PROGRAM_FILE) == @__FILE__
    results = solve_example_problems()
end