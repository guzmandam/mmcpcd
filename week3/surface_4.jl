using Plots

# Paso 1: Definir los rangos de u y v
u_vals = range(-5, 5, length=100)
v_vals = range(-5, 5, length=100)

# Crear mallas de u y v
U = [u for u in u_vals, v in v_vals]
V = [v for u in u_vals, v in v_vals]

# Paso 2: Calcular w
inside_sqrt = (U .+ (1 / sqrt(5))).^2 .+ (V .- 1).^2 .+ 3
inside_sqrt = max.(inside_sqrt, 0)  # Evitar valores negativos
W_positive = (3 / sqrt(5)) .+ (1/2) .* sqrt.(inside_sqrt)
W_negative = (3 / sqrt(5)) .- (1/2) .* sqrt.(inside_sqrt)

# Paso 3: Transformar a x, y y z
c1 = 1 / sqrt(5)
c2 = 2 / sqrt(5)
c3 = -2 / sqrt(5)

# x = c1 * u + c2 * w
X_pos = c1 .* U .+ c2 .* W_positive
X_neg = c1 .* U .+ c2 .* W_negative

# y = v
Y = V

# z = c3 * u + c1 * w
Z_pos = c3 .* U .+ c1 .* W_positive
Z_neg = c3 .* U .+ c1 .* W_negative

# Concatenar los valores positivos y negativos
X = [X_pos; X_neg]
Y = [Y; Y]
Z = [Z_pos; Z_neg]

# Filtrar puntos reales
mask = .~(isnan.(X) .| isnan.(Y) .| isnan.(Z))

X = X[mask]
Y = Y[mask]
Z = Z[mask]

# Paso 4: Graficar la superficie
p = scatter3d(X, Y, Z,
              markersize = 1.5,
              markercolor = :blue,
              xlabel = "X",
              ylabel = "Y",
              zlabel = "Z",
              title = "Superficie Cuádrica 3x^2-y^2+4xz-10x +2y-4z +3=0",
              legend = false)

savefig(p, "4.png")
