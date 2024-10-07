using LinearAlgebra

function ldlt_factorization()
    println("Ingrese la dimensión de la matriz (n x n):")
    n = parse(Int, readline())
    A = Matrix{Float64}(undef, n, n)
    println("Ingrese los valores de la matriz A, fila por fila:")
    for i in 1:n
        for j in 1:n
            print("Elemento ($i, $j): ")
            A[i, j] = parse(Float64, readline())
        end
    end

    L = Matrix{Float64}(I, n, n)  # Inicializar L con la matriz identidad
    D = Vector{Float64}(undef, n)  # Inicializar D como un vector

    for i in 1:n
        # Paso 1: Inicializar la diagonal de L con 1
        L[i, i] = 1.0

        # Paso 3: Calcular d_i
        D[i] = A[i, i] - sum(L[i, 1:(i-1)] .* D[1:(i-1)] .* L[i, 1:(i-1)])

        # Validación para la factorización
        if D[i] == 0.0
            println("Factorización imposible...")
            return
        end

        # Paso 4: Calcular l_ji para j > i
        for j in (i+1):n
            L[j, i] = (A[j, i] - sum(L[j, 1:(i-1)] .* D[1:(i-1)] .* L[i, 1:(i-1)])) / D[i]
        end
    end

    println("\nMatriz Original A:")
    display(A)

    println("\nMatriz L:")
    display(L)

    println("\nMatriz D:")
    display(D)

    println("\nMatriz LDL^T:")
    display(L * Diagonal(D) * L')

    return L, D
end

# Llamar a la función
ldlt_factorization()