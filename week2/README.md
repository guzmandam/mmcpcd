# Algoritmo 6.4 - Factorización LU

Se encuentra en el archivo `six_four.jl`. La matriz de `input` representa una matriz cuadrada de tamaño `n x n`.

El algoritmo está preparado para detectar cuando la factorización sea imposible.

## Input
El usuario deberá ingresar la dimensión `n` de la matriz para posteriormente ingresar los valores para cada posición de la matriz.

## Output
El programa retorna un `display` de cuatro matrices. La primera es la matriz original `A` (la que el usuario ingresa), la segunda es la matriz `L` (triangular inferior), la tercera es `U` (triangular superior) y la cuarta es el producto `L*U` que coincide con la primera, la matriz `A`.

Por ejemplo:

```
Original A
3×3 Matrix{Float64}:
 1.0  6.0  4.0
 2.0  6.0  2.0
 7.0  9.0  4.0

L
3×3 Matrix{Float64}:
 1.0  0.0  0.0
 2.0  1.0  0.0
 7.0  5.5  1.0

U
3×3 Matrix{Float64}:
 1.0   6.0   4.0
 0.0  -6.0  -6.0
 0.0   0.0   9.0

LU
3×3 Matrix{Float64}:
 1.0  6.0  4.0
 2.0  6.0  2.0
 7.0  9.0  4.0
```