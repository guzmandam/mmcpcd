include("utils.jl")

A = float(getMatrixInput())
display(A)

n, m = size(A)

for i in 1:(n-1)
    i_col = A[:, i] # Seleccionar toda la columna i
    row_index_w_max_abs_value = getMaxRowIndexByColumn(i_col, i) # Obtener el indice de la fila con el mayor valor absoluto

    println("Iteration $i")

    a_max_row_index = A[row_index_w_max_abs_value, i]

    if a_max_row_index == 0
        println("No unique solution")
        exit()
    end

    # Intercambiar si difieren los indices
    indexes_equal = row_index_w_max_abs_value == i
    if !indexes_equal
        # Realizar intercambio
        max_row = A[row_index_w_max_abs_value, :]
        i_row = A[i, :]
        
        A[i, :] = max_row
        A[row_index_w_max_abs_value, :] = i_row
    end

    for j in i+1:n
        a_ii = A[i, i] # Pivote
        # println("Pivote $i - $a_ii")
        a_ji = A[j, i]

        m_ji = a_ji / a_ii

        new_row = A[j, :] - (m_ji * A[i, :])
        A[j, :] = new_row   

        display(A)
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