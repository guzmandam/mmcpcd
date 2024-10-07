using Plots

# Definir el rango de variables
x_range = range(-5, 5, length=100)
y_range = range(-5, 5, length=100)
z_range = range(-5, 5, length=100)

# Crear una malla de coordenadas 3D
X_grid = repeat(x_range, inner=(length(y_range) * length(z_range)))
Y_grid = repeat(y_range, inner=length(z_range), outer=length(x_range))
Z_grid = repeat(z_range, outer=(length(x_range) * length(y_range)))

# Evaluar la ecuación en cada punto
F = 2 .* X_grid .* Y_grid .+ 2 .* X_grid .* Z_grid .+ 2 .* Y_grid .* Z_grid .- 4 .* X_grid .+ 6 .* Y_grid .+ 3

# Aplicar la máscara
epsilon = 0.1
mask = abs.(F) .< epsilon

X_pts = X_grid[mask]
Y_pts = Y_grid[mask]
Z_pts = Z_grid[mask]

# Graficar los puntos
p = scatter3d(X_pts, Y_pts, Z_pts,
              markersize = 1.0,
              markercolor = :blue,
              xlabel = "X",
              ylabel = "Y",
              zlabel = "Z",
              title = "Superficie Cuádrica: 2xy + 2xz + 2yz - 4x + 6y + 3 = 0",
              legend = false)

# Guardar el gráfico en un archivo sin mostrarlo
savefig(p, "3.png")