# Algoritmo de Householder para Matriz Tridiagonal

Este algoritmo tiene como objetivo transformar una matriz simétrica a una forma tridiagonal utilizando la transformación de Householder, implementada con la biblioteca `LinearAlgebra` de Julia.

La transformación de Householder se utiliza para simplificar la matriz, manteniendo sus valores propios y mejorando la eficiencia en cálculos posteriores, como descomposiciones espectrales.

## Input
El usuario deberá proporcionar una matriz simétrica `A` de tamaño `n x n`.

### Ejemplo de Input de Prueba
```julia
A = [4.0 1.0 1.0 0.0;
     1.0 3.0 1.0 1.0;
     1.0 1.0 2.0 1.0;
     0.0 1.0 1.0 2.0]
```

## Output
El programa transforma la matriz `A` en una matriz tridiagonal similar mediante la aplicación de la transformación de Householder.

Por ejemplo:

```
Matriz tridiagonal resultante:
4×4 Matrix{Float64}:
 4.0  1.0  0.0  0.0
 1.0  3.0  1.41421  0.0
 0.0  1.41421  2.0  1.0
 0.0  0.0  1.0  2.0
```

El programa muestra la matriz tridiagonal resultante que conserva las propiedades espectrales de la matriz original.

# Algoritmo Iterativo de Jacobi

Este algoritmo tiene como objetivo resolver un sistema de ecuaciones lineales utilizando el método iterativo de Jacobi, implementado con la biblioteca `LinearAlgebra` de Julia.

El método de Jacobi es una técnica iterativa que permite encontrar soluciones aproximadas para sistemas de ecuaciones lineales de la forma `Ax = b`, dividiendo la matriz `A` en sus componentes y realizando aproximaciones sucesivas.

## Input
El usuario deberá proporcionar:
- Una matriz `A` de tamaño `n x n`, que representa el sistema de ecuaciones.
- Un vector `b` de tamaño `n`.
- Un vector inicial `x0` de tamaño `n` (una primera estimación de la solución).
- La tolerancia `tol` para la condición de parada.
- El número máximo de iteraciones `max_iter`.

### Ejemplo de Input de Prueba
```julia
n = 3
A = [10.0 -1.0 0.0; -1.0 10.0 -2.0; 0.0 -2.0 10.0]
b = [9.0; 7.0; 6.0]
x0 = zeros(n)
tol = 1e-5
max_iter = 25
```

## Output
El programa calcula una solución aproximada para el sistema de ecuaciones dado o informa si no ha convergido dentro del número máximo de iteraciones permitido.

Por ejemplo:

```
La solución fue exitosa.
La solución aproximada es: [0.99997823456234, 0.80000223123434, 0.60000312331234]
```

El programa muestra la solución aproximada del sistema o indica que se excedió el número máximo de iteraciones sin encontrar una solución que cumpla con la tolerancia especificada.