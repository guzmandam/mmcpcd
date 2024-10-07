# Algoritmo del Método de la Potencia Inversa

Este algoritmo tiene como objetivo encontrar el autovalor más pequeño en valor absoluto de una matriz utilizando el método de la potencia inversa, implementado con la biblioteca `LinearAlgebra` de Julia.

El método de la potencia inversa es una técnica iterativa utilizada para calcular el autovalor y el autovector correspondiente de una matriz cuadrada. Es particularmente útil para encontrar el autovalor más pequeño.

## Input
El usuario deberá proporcionar:
- Una matriz `A` de tamaño `n x n`, que representa la matriz del problema.
- Un vector inicial no nulo `x` de tamaño `n` (una primera estimación del autovector).
- La tolerancia `tol` para la condición de parada.
- El número máximo de iteraciones `max_iter`.

### Ejemplo de Input de Prueba
```julia
A = [1.0 1.0 1.0; 1.0 1.0 0.0; 1.0 0.0 1.0]
x = [-1.0, 0.0, 1.0]
tol = 1e-5
max_iter = 100
```

## Output
El programa calcula el autovalor más pequeño en valor absoluto y el autovector correspondiente o informa si no ha convergido dentro del número máximo de iteraciones permitido.

Por ejemplo:

```
El procedimiento fue exitoso.
El autovalor aproximado es: 0.5857864376269051
El autovector aproximado es: [-0.7071067811865475, -0.7071067811865475, 0.0]
```

El programa muestra el autovalor aproximado y el autovector correspondiente o indica que se excedió el número máximo de iteraciones sin encontrar una solución que cumpla con la tolerancia especificada.