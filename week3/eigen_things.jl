using LinearAlgebra
using Symbolics

# Función para construir la matriz simétrica de la forma cuadrática
function construir_matriz_simétrica(A, B, C, D, E, F)
    # Convertir los coeficientes a símbolos si no lo son
    return [A D/2 E/2;
            D/2 B F/2;
            E/2 F/2 C]
end

# Ejemplo de uso
A, B, C = 0, 0, 0  # Coeficientes de x², y², z²
D, E, F = 2, 2, 2  # Coeficientes de xy, xz, yz

matriz_simetrica = float(construir_matriz_simétrica(A, B, C, D, E, F))

eigencosas = eigen([
    0 1 1 ;
    1 0 1 ;
    1 1 0
])

println("Eigenvalores: ", eigencosas.values)
println("Eigenvectores: ", eigencosas.vectors)
