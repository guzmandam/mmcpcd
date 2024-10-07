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