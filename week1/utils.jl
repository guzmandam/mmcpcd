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

function getMaxValuesByRow(row :: Vector{Float64}) :: Tuple{Int, Float64}
    index = argmax(abs.(row))
    value = row[index]

    return (index, value)
end

function get_s_is(M :: Matrix{Float64}):: Vector{Vector{Float64}}
    n, m = size(M)
    
    s_is = Vector{Vector{Float64}}(undef, n)

    for i in 1:n
        i_row = M[i,:][1:end-1]
    
        max_index, value = getMaxValuesByRow(i_row)
        s_i = [max_index, abs(value)]

        s_is[i] = s_i
    end

    return s_is
end

function get_max_col_index_quotient(col :: Vector{Float64}, start :: Int, s_is :: Vector{Vector{Float64}}) :: Int
    n = size(col)[1]
    
    quotients = Vector{Float64}(undef, n)

    for i in 1:n
        if (i < start)
            quotients[i] = 0.0
        else
            s_i_value = s_is[i][2]
            # s_i_index = s_is[i][1]

            q = col[i]/s_i_value

            quotients[i] = q
        end
    end

    max_index = argmax(abs.(quotients))

    return max_index
end