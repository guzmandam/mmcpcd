using LinearAlgebra
using Symbolics

# Función para construir la matriz simétrica de la forma cuadrática
function construir_matriz_simétrica(A, B, C, D, E, F)
    # Convertir los coeficientes a símbolos si no lo son
    A, B, C, D, E, F = Num[A, B, C, D, E, F]
    return [A D/2 E/2;
            D/2 B F/2;
            E/2 F/2 C]
end

# Función para calcular el polinomio característico de una matriz
function polinomio_característico(matriz)
    @variables λ  # Definir λ como un símbolo para el polinomio
    matriz_λ = matriz .- λ .* I(3)  # Asegurar que I(3) es una matriz identidad simbólica
    return det(matriz_λ)  # Calcular el determinante simbólico
end

# Función principal para calcular el polinomio característico de la superficie cuádrica
function cuádrica_polinomio_característico(A, B, C, D, E, F)
    matriz = construir_matriz_simétrica(A, B, C, D, E, F)
    return polinomio_característico(matriz)
end

# Ejemplo de uso
A, B, C = 0, 0, 0  # Coeficientes de x², y², z²
D, E, F = 2, 2, 2  # Coeficientes de xy, xz, yz

# Calcular el polinomio característico
polinomio = cuádrica_polinomio_característico(A, B, C, D, E, F)

println("El polinomio característico de la cuádrica es: ", polinomio)
