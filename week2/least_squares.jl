using Plots
using Statistics

function least_squares()
    println("Ingrese el número de puntos:")
    n = parse(Int, readline())
    x = Vector{Float64}(undef, n)
    y = Vector{Float64}(undef, n)

    println("Ingrese las coordenadas de los puntos:")
    for i in 1:n
        print("Punto $i - x: ")
        x[i] = parse(Float64, readline())
        print("Punto $i - y: ")
        y[i] = parse(Float64, readline())
    end

    # Cálculo de la pendiente (m) y el intercepto (b)
    x_mean = mean(x)
    y_mean = mean(y)
    m = sum((x .- x_mean) .* (y .- y_mean)) / sum((x .- x_mean) .^ 2)
    b = y_mean - m * x_mean

    println("\nPendiente (m): $m")
    println("Intercepto (b): $b")

    # Gráfica de los puntos y la línea de mejor ajuste
    p = scatter(x, y, label="Puntos", legend=:bottomright)
    plot!(p, x, m .* x .+ b, label="Línea de Mejor Ajuste", linewidth=2)
    display(p)
end

# Llamar a la función
least_squares()