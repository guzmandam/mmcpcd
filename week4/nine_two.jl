using LinearAlgebra

# Función para el método de la potencia simétrica
function potencia_simetrica(n, A, x, TOL, N)
    # Paso 1: Inicialización
    k = 1
    x = x / norm(x)  # Normalizamos el vector inicial

    # Paso 2: Bucle principal
    while k ≤ N
        # Paso 3: Multiplicamos la matriz por el vector
        y = A * x
        
        # Paso 4: Calculamos el cociente de Rayleigh
        μ = dot(x, y)
        
        # Paso 5: Si el vector 'y' es el vector nulo, se termina el proceso
        if norm(y) == 0
            println("Eigenvector: ", x)
            println("A tiene autovalor 0, selecciona un nuevo vector x y reinicia.")
            return
        end

        # Paso 6: Calculamos el error
        ERR = norm(x - (y / norm(y)))
        
        # Normalizamos el nuevo vector
        x = y / norm(y)
        
        # Paso 7: Si el error es menor que la tolerancia, el procedimiento fue exitoso
        if ERR < TOL
            println("El procedimiento fue exitoso.")
            return μ, x  # Retornamos el autovalor y el autovector
        end
        
        # Paso 8: Incrementamos el contador de iteraciones
        k += 1
    end

    # Paso 9: Si se excede el número de iteraciones, el procedimiento no fue exitoso
    println("Se excedió el número máximo de iteraciones.")
    return
end

# Ejemplo de uso
n = 3  # Dimensión de la matriz
A = [1.0 1.0 1.0; 1.0 1.0 0.0; 1.0 0.0 1.0]  # Matriz A
x = [-1.0, 0.0, 1.0]   # Vector inicial
TOL = 1e-6  # Tolerancia
N = 1000  # Número máximo de iteraciones

# Llamada a la función
μ, v = potencia_simetrica(n, A, x, TOL, N)

# Mostrar resultados si el procedimiento fue exitoso
if μ !== nothing
    println("Autovalor dominante aproximado: ", μ)
    println("Autovector correspondiente: ", v)
end

