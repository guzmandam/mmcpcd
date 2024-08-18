using LinearAlgebra
include("utils.jl")

A = getMatrixInput() # Square Matrix (n x n)
n, _ = size(A) # Get dimension (n)

# Initialize L and U 
L = Matrix{Float64}(I, n, n) # Identity matrix
U = zeros(Float64, n, n) # Start U as a zero matrix

# --- STEP 1 ---
if A[1,1] == 0.0
    println("(1) Factorization impossible...")
    exit()
end

U[1,1] = A[1,1]

# --- STEP 2 ---
for j in 2:n
    U[1, j] = A[1, j] / L[1, 1]
    L[j, 1] = A[j, 1] / U[1, 1]
end

# --- STEP 3 ---
for i in 2:n-1
    # --- STEP 4 ---
    sigma_l_u = 0.0
    for k in 1:i-1
        sigma_l_u += L[i, k]*U[k, i]
    end

    U[i,i] = A[i, i] - sigma_l_u

    # Validate that the product of diagonals is non-zero
    if U[i,i] == 0.0
        println("(2) Factorization impossible...")
        exit()
    end

    # --- STEP 5 ---
    for j in i+1:n
        sigma_l_u_for_u = 0.0
        sigma_l_u_for_l = 0.0

        for k in 1:i-1
            sigma_l_u_for_u += L[i, k]*U[k, j]
            sigma_l_u_for_l += L[j, k]*U[k, i]
        end

        U[i, j] = A[i, j] - sigma_l_u_for_u
        L[j, i] = (A[j, i] - sigma_l_u_for_l) / U[i,i]
    end
end

# --- STEP 6 ---
sigma_l_u_l = 0.0
for k in 1:n-1
    global sigma_l_u_l
    sigma_l_u_l += L[n, k]*U[k, n]
end

U[n, n] = A[n, n]  - sigma_l_u_l

# Security Check
if U[n, n] == 0.0
    println("(3) Factorization impossible...")
    exit()
end

println("Original A")
display(A)

println()

println("L")
display(L)

println()

println("U")
display(U)

println()
println("LU")
display(L*U)
