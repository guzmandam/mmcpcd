# Algoritmo de Jacobi para Valores y Vectores Propios

Se encuentra en el archivo `jacobi_eigen.jl`. Este algoritmo tiene como objetivo calcular los valores y vectores propios de una matriz simétrica utilizando el método de rotación de Jacobi, implementado con la biblioteca `LinearAlgebra` de Julia.

El método de Jacobi es un proceso iterativo que aplica una serie de rotaciones para eliminar los elementos fuera de la diagonal de una matriz simétrica, lo cual permite aproximar los valores propios y sus correspondientes vectores propios.

## Input
El usuario deberá proporcionar:
- Una matriz simétrica `A` de tamaño `n x n`, que representa la matriz del problema.
- La tolerancia `tol` para la condición de parada (por defecto es `1e-10`).
- El número máximo de iteraciones `max_iter` (por defecto es `3`).

### Ejemplo de Input de Prueba
```julia
A = [8.0 -2.0 3.0; -2.0 5.0 -1.0; 3.0 -1.0 7.0]
```

## Output
El programa calcula los valores y vectores propios aproximados de la matriz dada.

Por ejemplo:

```
Valores propios:
[10.1631, 5.8369, 4.0000]

Vectores propios:
[-0.745356, 0.298142, 0.596285;
  0.298142,  0.745356, -0.596285;
  0.596285, -0.596285, -0.541784]
```

El programa muestra los valores propios y los vectores propios correspondientes calculados utilizando el método de Jacobi, o bien informa si no ha convergido dentro del número máximo de iteraciones permitido.

# Descomposición en Valores Singulares (SVD)

Se encuentra en el archivo `svd_decomposition.jl`. Este algoritmo tiene como objetivo realizar la descomposición en valores singulares (SVD) de una matriz dada, utilizando la biblioteca `LinearAlgebra` de Julia.

La descomposición en valores singulares es una herramienta importante en el análisis de matrices, permitiendo expresar una matriz como el producto de tres matrices: una matriz ortogonal `U`, una matriz diagonal de valores singulares `S`, y otra matriz ortogonal `V`. Esta descomposición tiene muchas aplicaciones en álgebra lineal, como el análisis de datos y la reducción de dimensionalidad.

## Input
El usuario deberá proporcionar una matriz `A` de tamaño `m x n`.

### Ejemplo de Input de Prueba
```julia
A = [1.0 0.0 0.0; 0.0 2.0 0.0; 0.0 0.0 3.0]
```

## Output
El programa calcula la descomposición en valores singulares de la matriz dada, retornando las matrices `U`, `S` y `V`.

Por ejemplo:

```
Matriz U:
3×3 Matrix{Float64}:
 1.0  0.0  0.0
 0.0  1.0  0.0
 0.0  0.0  1.0

Valores singulares S:
3-element Vector{Float64}:
 3.0
 2.0
 1.0

Matriz V:
3×3 Matrix{Float64}:
 1.0  0.0  0.0
 0.0  1.0  0.0
 0.0  0.0  1.0
```

El programa muestra la matriz `U`, los valores singulares `S`, y la matriz `V` obtenidos a partir de la descomposición SVD de la matriz `A`.