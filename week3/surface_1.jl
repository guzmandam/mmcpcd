using Plots

# Definir el rango de u y v
u = range(-1, 1, length=200)
v = range(-1.5, 1.5, length=200)

# Crear una malla de coordenadas usando comprensiones de matrices
U = [ui for ui in u, vj in v]
V = [vj for ui in u, vj in v]

# Ecuación de la elipse en u y v
F = (5/2) .* U .^ 2 .+ (1/2) .* V .^ 2 .- 1

# Máscara para puntos que satisfacen la ecuación
mask = abs.(F) .< 0.01  # Ajusta el umbral según sea necesario

# Puntos que satisfacen la ecuación
U_pts = U[mask]
V_pts = V[mask]

# Matriz de transformación inversa (P^-1)
P_inv = inv([-sqrt(3)/2 1/2; 1/2 sqrt(3)/2])

# Transformar de vuelta a x y y
X_pts = P_inv[1,1] .* U_pts .+ P_inv[1,2] .* V_pts
Y_pts = P_inv[2,1] .* U_pts .+ P_inv[2,2] .* V_pts

# Valores de z
z_vals = range(-2, 2, length=20)

# Inicializar arreglos para puntos en 3D
X_3D = []
Y_3D = []
Z_3D = []

for z in z_vals
    append!(X_3D, X_pts)
    append!(Y_3D, Y_pts)
    append!(Z_3D, fill(z, length(X_pts)))
end

# Graficar en 3D
p = scatter3d(X_3D, Y_3D, Z_3D,
          markersize=0.5,
          color=:blue,
          xlabel="X", ylabel="Y", zlabel="Z",
          title="Superficie Cuádrica: 2x² - √3 xy + y² = 1",
          legend=false)


# Guardar el gráfico
savefig(p, "1.png")
