using PrettyTables
using Random

function getMaxRowIndexByColumn(column :: Vector{Float64}, startRowIndex :: Int = 1) :: Int
    maxIndex = startRowIndex
    n = size(column)[1]

    for i in startRowIndex:n
        max_number = abs(column[maxIndex])
        actual_number = abs(column[i])

        if actual_number >= max_number
            maxIndex = i
        end
    end

    return maxIndex
end

function getFirstIndexNonZero(array :: Array, start :: Int) :: Int
    indexC = 0
    for (index, num) in enumerate(array)
        if num != 0 && (index>=start)
            indexC = index
        elseif index <= start
            indexC = start
        end
    end

    return indexC
end


function printMatrix(matrix :: Matrix)
    n = size(matrix)[2]

    headers = ["" for _ in 1:n]

    pretty_table(matrix, header=headers)
end

function getMatrixInput() :: Matrix{Float64}
    println("Creando la matriz")
    println("Ingresa el numero de filas: ")
    n = parse(Int, readline())
    println("Ingresa el numero de columnas: ")
    m = parse(Int, readline())

    if m != n+1
        println("Error de dimension")
        exit()
    end

    M = Matrix{Float64}(undef, n, m)
    
    for i in 1:n
        for j in 1:m
            print("Ingresa el número en la posición [$i, $j]: ")
            num = parse(Float64, readline())
            M[i,j] = num
            println()
        end
    end

    return M
end

function getVectorInput(vectorName :: String, dim :: Int) :: Vector{Float64}
    """
     sdsdsd
    """
    println("Creando el vector $vectorName")
    n = dim

    V = Vector{Float64}(undef, n)

    for i in 1:n
        print("Ingresa el número en la posición [$i]: ")
        num = parse(Float64, readline())
        V[i] = num
        println()
    end

    return V
end