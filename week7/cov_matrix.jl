using Random
using Random
using LinearAlgebra
using PrettyTables
using Distributions  # Para generar datos aleatorios

# Establecer una semilla para la reproducibilidad
Random.seed!(42)

# Definir las medias y desviaciones estándar
media_peso = 54.2
media_altura = 161.7
media_ancho_hombros = 36.5
media_ancho_caderas = 30.1

desviacion_peso = 5.0
desviacion_altura = 10.0
desviacion_ancho_hombros = 2.0
desviacion_ancho_caderas = 2.0

# Generar datos aleatorios para 100 participantes
n_participantes = 100
peso = rand(Normal(media_peso, desviacion_peso), n_participantes)
altura = rand(Normal(media_altura, desviacion_altura), n_participantes)
ancho_hombros = rand(Normal(media_ancho_hombros, desviacion_ancho_hombros), n_participantes)
ancho_caderas = rand(Normal(media_ancho_caderas, desviacion_ancho_caderas), n_participantes)

# Crear una matriz de datos
X = hcat(peso, altura, ancho_hombros, ancho_caderas)

# 2. Estandarizar los datos manualmente
function standardize(X)
    X_mean = mean(X, dims=1)
    X_std = std(X, dims=1)
    return (X .- X_mean) ./ X_std
end

X_standardized = standardize(X)

# 3. Calcular la matriz de covarianza utilizando la función cov
cov_matrix = cov(X_standardized)

println("\nMatriz de covarianza:")
pretty_table(cov_matrix, header = ["x1", "x2", "x3", "x4"], title = "Matriz de Covarianza")

# 4. Descomposición en valores y vectores propios
eigvals, eigvecs = eigen(cov_matrix)

# Ordenar los valores propios en orden descendente
indices = sortperm(eigvals, rev=true)
eigvals_sorted = eigvals[indices]
eigvecs_sorted = eigvecs[:, indices]

# Mostrar los valores propios y vectores propios
println("\nValores propios:")
pretty_table(eigvals_sorted, header = ["Valores Propios"])

println("\nVectores propios (Componentes principales):")
pretty_table(eigvecs_sorted, header = ["PC1", "PC2", "PC3", "PC4"])

# 5. Proyectar los datos a los nuevos componentes principales
X_pca = X_standardized * eigvecs_sorted

println("\nDatos proyectados a los componentes principales (PCA):")
pretty_table(X_pca, header = ["Componente 1", "Componente 2", "Componente 3", "Componente 4"])
