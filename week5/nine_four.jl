using LinearAlgebra

function householder_tridiagonal(A)
    n = size(A, 1)
    A_tridiagonal = copy(A)

    for k in 1:(n - 2)
        # Paso 2: Calcular q
        q = sum(A_tridiagonal[j, k]^2 for j in (k + 1):n)

        # Paso 3: Calcular alfa
        if A_tridiagonal[k + 1, k] == 0
            alfa = -sqrt(q)
        else
            alfa = -sign(A_tridiagonal[k + 1, k]) * sqrt(q)
        end

        # Paso 4: Calcular RSQ
        RSQ = alfa^2 - alfa * A_tridiagonal[k + 1, k]

        # Paso 5: Inicializar v
        v = zeros(n)
        v[k + 1] = A_tridiagonal[k + 1, k] - alfa
        v[(k + 2):n] .= A_tridiagonal[(k + 2):n, k]

        # Paso 6: Calcular u
        u = (1 / RSQ) * A_tridiagonal * v

        # Paso 7: Calcular PROD
        PROD = dot(v, u)

        # Paso 8: Calcular z
        z = u - (PROD / (2 * RSQ)) * v

        # Paso 9-10: Actualizar A_tridiagonal
        for l in (k + 1):n
            for j in l:n
                A_tridiagonal[l, j] -= v[l] * z[j] + v[j] * z[l]
                A_tridiagonal[j, l] = A_tridiagonal[l, j]  # Mantener la simetría
            end
        end

        # Paso 11-14: Actualizar valores específicos de A_tridiagonal
        A_tridiagonal[k + 1, k] = v[k + 1]
        A_tridiagonal[k, k + 1] = v[k + 1]
        A_tridiagonal[(k + 2):n, k] .= 0
        A_tridiagonal[k, (k + 2):n] .= 0
    end

    return A_tridiagonal
end

# Ejemplo de uso
A = [4.0 1.0 1.0 0.0;
     1.0 3.0 1.0 1.0;
     1.0 1.0 2.0 1.0;
     0.0 1.0 1.0 2.0]

A_tridiagonal = householder_tridiagonal(A)
println("Matriz tridiagonal resultante:")
display(A_tridiagonal)