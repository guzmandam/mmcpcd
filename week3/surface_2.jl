using Plots

# Paso 1: Definir constantes
c1 = 1 / sqrt(3)       # ≈ 0.57735
c2 = 1 / sqrt(2)       # ≈ 0.70711
c3 = 1 / sqrt(6)       # ≈ 0.40825
c4 = 2 / sqrt(6)       # ≈ 0.8165

# Paso 2: Definir el rango de u y θ
u_vals = range(-2, 2, length=50)
theta_vals = range(0, 2π, length=100)

# Crear mallas de coordenadas usando comprensiones de matrices
U = [u for u in u_vals, θ in theta_vals]
Θ = [θ for u in u_vals, θ in theta_vals]

# Paso 3: Calcular v y w
V = 3 .* cos.(Θ)
W = sqrt(3) .* sin.(Θ)

# Paso 4: Calcular x, y y z
X = c1 .* U .+ c4 .* W
Y = -c1 .* U .+ c2 .* V .+ c3 .* W
Z = -c1 .* U .- c2 .* V .+ c3 .* W

# Paso 5: Graficar la superficie
s = surface(X, Y, Z,
        xlabel = "X",
        ylabel = "Y",
        zlabel = "Z",
        title = "Superficie Cuádrica: 2x² + y² + z² + 2xy + 2xz = 9",
        legend = false)

savefig(s, "2.png")