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

# Algoritmo 6.5 - Factorización LDL^T

Se encuentra en el archivo `ldlt_factorization.jl`. La matriz de `input` representa una matriz simétrica definida positiva de tamaño `n x n`.

El algoritmo está preparado para factorizar la matriz en una matriz triangular inferior `L` y una matriz diagonal `D` con entradas positivas en la diagonal, de forma que `A = L * D * L'`.

## Input
El usuario deberá ingresar la dimensión `n` de la matriz, seguida de los valores para cada posición de la matriz `A`.

## Output
El programa retorna un `display` de cuatro resultados: la matriz original `A` (la que el usuario ingresa), la matriz `L` (triangular inferior con `1` en la diagonal principal), la matriz diagonal `D`, y el producto `L * D * L^T` que coincide con la matriz `A`.

Por ejemplo:

```
Ingrese la dimensión de la matriz (n x n):
3
Ingrese los valores de la matriz A, fila por fila:
Elemento (1, 1): 4
Elemento (1, 2): 2
Elemento (1, 3): 4
Elemento (2, 1): 2
Elemento (2, 2): 5
Elemento (2, 3): 2
Elemento (3, 1): 4
Elemento (3, 2): 2
Elemento (3, 3): 6

Matriz Original A:
3×3 Matrix{Float64}:
 4.0  2.0  4.0
 2.0  5.0  2.0
 4.0  2.0  6.0

Matriz L:
3×3 Matrix{Float64}:
 1.0  0.0   0.0
 0.5  1.0   0.0
 1.0 -0.2   1.0

Matriz D:
3-element Vector{Float64}:
 4.0
 4.0
 3.2

Matriz LDL^T:
3×3 Matrix{Float64}:
 4.0  2.0  4.0
 2.0  5.0  2.0
 4.0  2.0  6.0
```

# Algoritmo de Mínimos Cuadrados

Se encuentra en el archivo least_squares.jl. El objetivo de este algoritmo es encontrar la mejor línea de ajuste para un conjunto de puntos en el plano, utilizando el método de mínimos cuadrados para minimizar la suma de los cuadrados de los residuos.

El algoritmo calcula los coeficientes de una línea de la forma y = mx + b que mejor se ajusta a los datos proporcionados.

## Input

El usuario deberá ingresar el número de puntos n seguido de las coordenadas (x, y) de cada punto.

## Output

El programa retorna los valores de la pendiente m y el intercepto b