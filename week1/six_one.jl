include("utils.jl")

A = float(getMatrixInput())
printMatrix(A)

n, m = size(A)

# Recorrer las columnas/filas de la matriz
for i in 1:n-1 # En el libro se menciona que es de 1 a n-1 pues se toma la matriz aumentada
    i_col = A[:, i] # Tomar toda la columna i
    min_row_index_nonzero_in_col = getFirstIndexNonZero(i_col, i)

    println("Iteration $i")
    # println("Iteration $i - $i_col")
    # println("MinRowIndexNonZero - $min_row_index_nonzero_in_col")
    
    if min_row_index_nonzero_in_col == 0
        println("No unique solution") # OK
        exit() 
    end

    if (min_row_index_nonzero_in_col != i)
        # Swap rows
        i_row = A[i, :]
        min_index_row = A[min_row_index_nonzero_in_col, :]

        A[i, :] = min_index_row
        A[min_row_index_nonzero_in_col, :] = i_row
    end

    for j in i+1:n
        a_ii = A[i, i] # Pivote
        # println("Pivote $i - $a_ii")
        a_ji = A[j, i]

        m_ji = a_ji / a_ii

        new_row = A[j, :] - (m_ji * A[i, :])
        A[j, :] = new_row

        printMatrix(A)
    end
end

if A[n,n] == 0
    println("No unique solution exists after loop")
    exit()
end

x_n = A[n, n+1]/A[n, n]
solutions = zeros(Float64, n)

solutions[n] = x_n

for i in 1:n-1
    # Print rows in reverse
    k = n-i

    k_row = A[k, :]
    k_row_without_b = reverse(k_row[1:end-1])
    b_element_k_row = k_row[end]
    coeff_row = k_row[k]

    known_solutions = reverse(solutions[k+1:end])
    
    sum_known_coeff_by_row = 0

    for (i, _) in enumerate(known_solutions)
        sum_known_coeff_by_row += (known_solutions[i] * k_row_without_b[i])
    end

    x_i = ( (b_element_k_row) - (sum_known_coeff_by_row) ) / (coeff_row)

    solutions[k] = x_i
end

println()
println("Solucion: $solutions")