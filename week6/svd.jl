using LinearAlgebra

function svd_decomposition(A)
    # Calcular la descomposición en valores singulares
    U, S, V = svd(A)
    return U, S, V
end

# Ejemplo de uso
A = [1.0 0.0 0.0; 0.0 2.0 0.0; 0.0 0.0 3.0]
U, S, V = svd_decomposition(A)

println("Matriz U:")
display(U)

println("Valores singulares S:")
display(S)

println("Matriz V:")
display(V)