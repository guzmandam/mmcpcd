# Análisis de Componentes Principales (PCA) en el Conjunto de Datos Iris

Este algoritmo tiene como objetivo aplicar el Análisis de Componentes Principales (PCA) para reducir la dimensionalidad del conjunto de datos Iris, utilizando las bibliotecas `RDatasets`, `MultivariateStats`, `DataFrames`, `LinearAlgebra`, y `Statistics` de Julia.

El PCA es una técnica de reducción de dimensionalidad que se utiliza para proyectar los datos en un nuevo espacio de menor dimensión, conservando la mayor cantidad posible de la varianza original de los datos. Este algoritmo aplica el PCA al conjunto de datos Iris para facilitar el análisis y la visualización.

## Input
El conjunto de datos Iris es cargado automáticamente desde la biblioteca `RDatasets`. No se requiere que el usuario proporcione datos adicionales.

### Ejemplo de Input
El conjunto de datos Iris contiene información sobre 150 flores de tres especies diferentes, con las siguientes características:
- Largo y ancho del sépalo (`Sepal.Length`, `Sepal.Width`).
- Largo y ancho del pétalo (`Petal.Length`, `Petal.Width`).

## Procedimiento
1. **Cargar y dividir los datos**: Se carga el conjunto de datos Iris y se divide en conjuntos de entrenamiento y prueba.
2. **Centralizar los datos**: Se centralizan los datos de entrenamiento y prueba restando su media.
3. **Calcular la matriz de covarianza**: Se calcula la matriz de covarianza de los datos centralizados.
4. **Calcular los valores y vectores propios**: Se obtienen los valores propios y vectores propios de la matriz de covarianza.
5. **Seleccionar los componentes principales**: Se ordenan los componentes principales y se seleccionan los tres primeros.
6. **Proyectar los datos**: Se proyectan los datos de entrenamiento y prueba en el nuevo espacio de menor dimensión.

## Output
El programa proyecta los datos en el nuevo espacio definido por los componentes principales seleccionados.

Por ejemplo:

```
Matriz de covarianza:
4×4 Matrix{Float64}:
 0.685693   -0.0392686  1.27368  0.516904
 -0.0392686  0.188004   -0.321713 -0.117491
 1.27368    -0.321713   3.11318  1.29842
 0.516904   -0.117491   1.29842  0.582414

Valores propios:
[4.228241706008013, 0.2426707479286324, 0.07820950004283818, 0.02383509249956988]

Datos proyectados en el nuevo espacio:
3×75 Matrix{Float64}:
 -2.68413   -2.71539   -2.88982  ...  1.41646    0.899589   1.56874
 -0.319397  -0.177001  -0.144949     0.388584   0.136428   0.240263
  0.0279149  0.210464   0.0179003    0.0695261 -0.0376721  0.0562285
```

El programa muestra la matriz de covarianza, los valores propios, y los datos proyectados en el nuevo espacio de menor dimensión, lo cual facilita el análisis visual y la comprensión de los patrones dentro del conjunto de datos.

# Análisis de Componentes Principales (PCA) en Datos Generados Aleatoriamente

Este algoritmo tiene como objetivo aplicar el Análisis de Componentes Principales (PCA) para reducir la dimensionalidad de un conjunto de datos generado aleatoriamente, utilizando las bibliotecas `Distributions`, `LinearAlgebra`, `PrettyTables`, y `Statistics` de Julia.

El PCA es una técnica de reducción de dimensionalidad que se utiliza para proyectar los datos en un nuevo espacio de menor dimensión, conservando la mayor cantidad posible de la varianza original de los datos. Este algoritmo aplica el PCA a un conjunto de datos simulados para ilustrar cómo se puede utilizar esta técnica para analizar datos complejos.

## Input
El usuario no necesita proporcionar datos externos. Los datos se generan aleatoriamente con las siguientes características:
- **Peso**: media = 54.2 kg, desviación estándar = 5.0 kg
- **Altura**: media = 161.7 cm, desviación estándar = 10.0 cm
- **Ancho de hombros**: media = 36.5 cm, desviación estándar = 2.0 cm
- **Ancho de caderas**: media = 30.1 cm, desviación estándar = 2.0 cm

Se generan datos para 100 participantes.

## Procedimiento
1. **Generar datos aleatorios**: Se generan 100 muestras de datos aleatorios para las variables de peso, altura, ancho de hombros y ancho de caderas.
2. **Estandarizar los datos**: Los datos se estandarizan restando la media y dividiendo entre la desviación estándar de cada característica.
3. **Calcular la matriz de covarianza**: Se calcula la matriz de covarianza de los datos estandarizados.
4. **Calcular los valores y vectores propios**: Se obtienen los valores propios y vectores propios de la matriz de covarianza.
5. **Ordenar los componentes principales**: Se ordenan los valores y vectores propios en orden descendente de los valores propios.
6. **Proyectar los datos en los nuevos componentes principales**: Se proyectan los datos en el nuevo espacio definido por los componentes principales.

## Output
El programa muestra los resultados del PCA incluyendo la matriz de covarianza, los valores propios, los vectores propios (componentes principales), y los datos proyectados en el nuevo espacio de componentes principales.

Por ejemplo:

```
Matriz de Covarianza:
┌──────────┬──────────┬──────────┬──────────┐
│        x1│        x2│        x3│        x4│
├──────────┼──────────┼──────────┼──────────┤
│      1.01│     -0.03│      0.99│      0.30│
│     -0.03│      1.00│     -0.20│     -0.15│
│      0.99│     -0.20│      1.02│      0.26│
│      0.30│     -0.15│      0.26│      1.00│
└──────────┴──────────┴──────────┴──────────┘

Valores propios:
┌──────────────────┐
│   Valores Propios│
├──────────────────┤
│           2.21308│
│           1.15632│
│           0.78937│
│           0.24123│
└──────────────────┘

Vectores propios (Componentes principales):
┌──────────┬──────────┬──────────┬──────────┐
│       PC1│       PC2│       PC3│       PC4│
├──────────┼──────────┼──────────┼──────────┤
│     0.57 │     -0.41│      0.68│     -0.23│
│    -0.22 │      0.84│     -0.25│     -0.43│
│     0.78 │     -0.08│     -0.63│      0.09│
│     0.14 │      0.33│      0.29│      0.89│
└──────────┴──────────┴──────────┴──────────┘

Datos proyectados a los componentes principales (PCA):
┌───────────────┬───────────────┬───────────────┬───────────────┐
│   Componente 1│   Componente 2│   Componente 3│   Componente 4│
├───────────────┼───────────────┼───────────────┼───────────────┤
│     -1.4123028│      0.2252359│      0.4085794│      0.0523044│
│     -1.2811905│      0.1671491│     -0.1076258│      0.4096372│
│      0.2078634│     -0.1443972│     -0.2394297│     -0.5076132│
│     ...       │     ...       │     ...       │     ...       │
└───────────────┴───────────────┴───────────────┴───────────────┘
```

El programa muestra la matriz de covarianza, los valores propios, los vectores propios (componentes principales), y los datos proyectados en el nuevo espacio de componentes principales, lo cual facilita el análisis visual y la comprensión de los patrones subyacentes en los datos.