# Algoritmo para Obtener los Vectores Propios de una Superficie Cuádrica

Se encuentra en el archivo `eigen_things.jl`. Este algoritmo tiene como objetivo construir la matriz simétrica asociada a una ecuación de superficie cuádrica, y posteriormente calcular sus valores y vectores propios utilizando la biblioteca `LinearAlgebra` de Julia.

La matriz simétrica se construye a partir de los coeficientes de la ecuación cuádrica, permitiendo analizar la forma y la orientación de la cuádrica en términos de sus valores propios y vectores propios.

## Input
El usuario deberá proporcionar los coeficientes de la forma cuádrica, que incluyen los términos cuadrados `A`, `B`, `C` y los términos cruzados `D`, `E`, `F`.

## Output
El programa construye una matriz simétrica a partir de los coeficientes proporcionados y calcula sus valores y vectores propios.

# Algoritmo para Calcular el Polinomio Característico de una Superficie Cuádrica

Se encuentra en el archivo `characteristic_polynomial.jl`. Este algoritmo tiene como objetivo construir la matriz simétrica asociada a una ecuación de superficie cuádrica y calcular su polinomio característico utilizando las bibliotecas `LinearAlgebra` y `Symbolics` de Julia.

El polinomio característico se utiliza para encontrar los valores propios de la matriz asociada a la superficie cuádrica, lo cual proporciona información importante sobre la geometría de la cuádrica.

## Input
El usuario deberá proporcionar los coeficientes de la forma cuádrica, que incluyen los términos cuadrados `A`, `B`, `C` y los términos cruzados `D`, `E`, `F`.

## Output
El programa construye una matriz simétrica a partir de los coeficientes proporcionados y calcula su polinomio característico.

# Algoritmo para Solución de Mínimos Cuadrados con Pseudoinversa

Se encuentra en el archivo `pseudoinv.jl`. Este algoritmo tiene como objetivo aplicar la matriz pseudoinversa para obtener la solución de mínimos cuadrados para un sistema lineal, utilizando la biblioteca `LinearAlgebra` de Julia.

La pseudoinversa se utiliza para resolver sistemas lineales sobredeterminados o que no tienen una solución exacta, minimizando la suma de los errores cuadráticos.

## Input
El usuario deberá proporcionar una matriz `A` de tamaño `m x n`, donde `m` es el número de ecuaciones y `n` el número de incógnitas.

### Ejemplo de Input de Prueba
```julia
A = [3 2 0;
     1 0 0;
     0 2 3]
```

## Output
El programa calcula la pseudoinversa de la matriz `A` y resuelve el sistema para un vector `b` aleatorio generado internamente.

Por ejemplo:

```
Solución de mínimos cuadrados utilizando la pseudoinversa: [0.876, -0.234, 0.156]
```

El programa muestra la solución del sistema utilizando la pseudoinversa, minimizando la suma de los errores cuadráticos en el caso de sistemas sin una solución exacta.