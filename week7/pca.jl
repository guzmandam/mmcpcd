import Pkg;Pkg.add("RDatasets")
import Pkg; Pkg.add("MultivariateStats")
import Pkg; Pkg.add("DataFrames")
using MultivariateStats, RDatasets, Plots
using LinearAlgebra, Statistics
# load iris dataset
iris = dataset("datasets", "iris")

# split half to training set
Xtr = Matrix(iris[1:2:end,1:4])'
Xtr_labels = Vector(iris[1:2:end,5])

# split other half to testing set
Xte = Matrix(iris[2:2:end,1:4])'
Xte_labels = Vector(iris[2:2:end,5])

iris_df = DataFrame(iris)

#Centralizamos los datos:
X_centralizado = Xtr .-mean(Xtr, dims = 2)

Y_centralizado = Xte .-mean(Xte, dims = 2)

#Calculamos la matriz de covarianza
matriz_cov = cov(X_centralizado')
println(matriz_cov)
#Calculamos ahora los vectores y valores propios:
valores_propios, vectores_propios = eigen(matriz_cov)
println(valores_propios)

# 4. Ordenar los componentes principales (valores propios y vectores)
indices_ordenados = sortperm(valores_propios, rev=true)
vectores_ordenados = vectores_propios[:, indices_ordenados]
valores_ordenados = valores_propios[indices_ordenados]  
println(valores_ordenados)

# 5. Seleccionar el número de componentes principales
num_componentes = 3 
vectores_seleccionados = vectores_ordenados[:, 1:num_componentes]

# 6. Proyectar los datos en el nuevo espacio
Xtr_proyectado = vectores_seleccionados' * X_centralizado  # Transponer para que las dimensiones coincidan

Xtr_proyectado

# 6. Proyectar los datos en el nuevo espacio
Xte_proyectado = vectores_seleccionados' * Y_centralizado  # Transponer para que las dimensiones coincidan

println("Datos proyectados en el nuevo espacio:")
Xte_proyectado