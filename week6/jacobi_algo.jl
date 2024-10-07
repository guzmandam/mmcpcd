# Función para aplicar la rotación de Jacobi
using LinearAlgebra
function jacobi_rotation!(A, p, q)
    if A[p, q] != 0
        # Calcular θ de manera segura
        θ = (A[q, q] - A[p, p]) / (2 * A[p, q])
        t = sign(θ) / (abs(θ) + sqrt(θ^2 + 1))
        c = 1 / sqrt(1 + t^2)
        s = t * c

        # Actualizar la matriz A
        for i in 1:size(A, 1)
            if i != p && i != q
                Aip = A[i, p]
                Aiq = A[i, q]
                A[i, p] = c * Aip - s * Aiq
                A[i, q] = s * Aip + c * Aiq
                A[p, i] = A[i, p]
                A[q, i] = A[i, q]
            end
        end

        App = A[p, p]
        Aqq = A[q, q]
        A[p, p] = c^2 * App - 2 * s * c * A[p, q] + s^2 * Aqq
        A[q, q] = s^2 * App + 2 * s * c * A[p, q] + c^2 * Aqq
        A[p, q] = 0
        A[q, p] = 0
    end
end

# Algoritmo de Jacobi para calcular valores y vectores propios
function jacobi_eigen(A, tol=1e-10, max_iter=3)
    n = size(A, 1)
    V = Matrix(1.0I, n, n)  # Matriz de vectores propios (inicialmente identidad)
    for iter in 1:max_iter
        max_val = 0.0
        p, q = 1, 2

        # Encontrar el valor absoluto máximo fuera de la diagonal
        for i in 1:n-1
            for j in i+1:n
                if abs(A[i, j]) > max_val
                    max_val = abs(A[i, j])
                    p, q = i, j
                end
            end
        end

        # Si todos los elementos fuera de la diagonal son suficientemente pequeños, detenerse
        if max_val < tol
            break
        end

        # Aplicar rotación de Jacobi
        jacobi_rotation!(A, p, q)

        # Actualizar la matriz de vectores propios
        for i in 1:n
            Vip = V[i, p]
            Viq = V[i, q]
            θ = (A[q, q] - A[p, p]) / (2 * A[p, q])  # Recalculamos θ para actualizar vectores
            t = sign(θ) / (abs(θ) + sqrt(θ^2 + 1))
            c = 1 / sqrt(1 + t^2)
            s = t * c
            V[i, p] = c * Vip - s * Viq
            V[i, q] = s * Vip + c * Viq
        end
    end
    # Extraer solo los valores propios (diagonal de A) y devolverlos junto con los vectores propios
    return diagm(A[diagind(A)]), V
end

# Ejemplo de uso
A = [8.0 -2.0 3.0; -2.0 5.0 -1.0; 3.0 -1.0 7.0]
eigenvalues, eigenvectors = jacobi_eigen(A)

println("Valores propios:")
println(eigenvalues)

println("Vectores propios:")
println(eigenvectors)




