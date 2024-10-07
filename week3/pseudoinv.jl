using LinearAlgebra

# Función para calcular la matriz pseudoinversa y aplicar la solución de mínimos cuadrados
function solve_least_squares_pseudoinverse(A)
    # Calcular la pseudoinversa de la matriz A
    A_pseudo = pinv(A)

    # Resolver para cada valor propio utilizando la pseudoinversa
    # Asumimos que b es un vector de resultados correspondientes a A * x = b
    b = rand(size(A, 1))  # Vector de tamaño adecuado para probar
    x = A_pseudo * b

    return x
end

# Ejemplo de uso
A = [3 2 0;
     1 0 0;
     0 2 3]

solucion = solve_least_squares_pseudoinverse(A)
println("Solución de mínimos cuadrados utilizando la pseudoinversa:", solucion)