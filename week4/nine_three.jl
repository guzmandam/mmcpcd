using LinearAlgebra

function inverse_power_method(A, x, tol, max_iter)
    n = length(x)  # Dimensión de la matriz y el vector
    q = (x' * A * x) / (x' * x)  # Paso 1: Calculamos q

    k = 1  # Paso 2: Iteración inicial

    # Paso 3: Encontramos el índice p donde |xp| = ||x||∞
    p = argmax(abs.(x))  # Índice del valor absoluto máximo de x
    x /= x[p]  # Paso 4: Normalizamos x dividiéndolo por xp

    y = similar(x)  # Inicializamos y con una estructura similar a x

    # ITERAMOS
    while k <= max_iter
        # Paso 6: Resolver el sistema (A - qI)y = x
        try
            y = (A - q * I(n)) \ x  # Resolvemos para y
        catch e
            println("Error: No se pudo resolver el sistema. Detalles: ", e)
            println("q es un autovalor: ", q)
            return q, x  # Paso 7: Si no tiene solución única, q es un autovalor
        end

        # Paso 8: Definir μ como yp
        μ = y[p]

        # Paso 9: Encontramos el índice p donde |yp| = ||y||∞
        p = argmax(abs.(y))

        # Paso 10: Calculamos el error ERR y actualizamos x
        ERR = norm(x - (y / y[p]), Inf)
        x = y / y[p]

        # Paso 11: Si el error es menor que la tolerancia, terminamos con éxito
        if ERR < tol
            μ = (1 / μ) + q
            println("El procedimiento fue exitoso.")
            return μ, x  # Retornamos el autovalor aproximado y el autovector
        end

        k += 1  # Paso 12: Incrementamos la iteración
    end

    # Paso 13: Si excede el número máximo de iteraciones
    println("Se excedió el número máximo de iteraciones. Procedimiento sin éxito.")
    return nothing, nothing
end

# Ejemplo de uso
A = [1.0 1.0 1.0; 1.0 1.0 0.0; 1.0 0.0 1.0]  # Matriz A
x = [-1.0, 0.0, 1.0]  # Vector inicial no nulo
tol = 1e-5  # Tolerancia
max_iter = 100  # Número máximo de iteraciones

# Llamamos al método de la potencia inversa
eigenvalue, eigenvector = inverse_power_method(A, x, tol, max_iter)

if eigenvalue !== nothing
    println("El autovalor aproximado es: ", eigenvalue)
    println("El autovector aproximado es: ", eigenvector)
end

