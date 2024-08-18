function getMatrixInput() :: Matrix{Float64}
    println("Creando la matriz cuadrada de n x n")
    print("Ingresa la dimension de la matriz (n): ")
    n = parse(Int, readline())

    M = Matrix{Float64}(undef, n, n)

    println()
    
    for i in 1:n
        for j in 1:n
            print("Ingresa el número en la posición [$i, $j]: ")
            num = parse(Float64, readline())
            M[i,j] = num
            println()
        end
    end

    return M
end