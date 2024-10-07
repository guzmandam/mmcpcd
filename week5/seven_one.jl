using LinearAlgebra

function jacobi_iterative(A, b, x0, tol, max_iter)
    n = size(A, 1)  
    x = copy(x0)   
    
    for k in 1:max_iter
        x_new = copy(x)  # Copiamos x para almacenar el nuevo valor
        
        for i in 1:n
            sum = 0.0
            for j in 1:n
                if j != i
                    sum += A[i, j] * x[j]
                end
            end
            x_new[i] = (b[i] - sum) / A[i, i]  # Actualizamos x_new[i]
        end
        
        # Comprobamos la convergencia
        if norm(x_new - x) < tol
            println("La solución fue exitosa.")
            return x_new  # Salimos con la solución aproximada
        end
        
        x = copy(x_new)  # Actualizamos x para la siguiente iteración
    end
    
    println("Se excedió el número máximo de iteraciones.\n
    Procedimiento terminado sin éxito")
    return nothing  # Retorna nada si no se encuentra solución
end

# Ejemplo de uso
n = 3  # Número de ecuaciones
A = [10.0 -1.0 0.0; -1.0 10.0 -2.0; 0.0 -2.0 10.0]  # Matriz A
b = [9.0; 7.0; 6.0]  # Vector b
x0 = zeros(n)  # Aproximación inicial x(0)
tol = 1e-5  # Tolerancia
max_iter = 25 # Número máximo de iteraciones

# Llamamos a la función
solution = jacobi_iterative(A, b, x0, tol, max_iter)

if solution !== nothing
    println("La solución aproximada es: ", solution)
end