include("utils.jl")

# A = [
#      2.11 -4.21 0.921 2.01 ;
#      4.01 10.2 -1.12 -3.09 ;
#      1.09 0.987 0.832 4.21
#     ]
A = float(getMatrixInput())
n, m = size(A)
s_is = get_s_is(A)

for s in s_is
    if s == 0
        println("No es posible obtener una solucion unica")
    end
end

for i in 1:n-1
    i_column = A[:, i]
    i_row = A[i, :]

    println("Column $i - $i_column")

    swap_index = convert(Int, get_max_col_index_quotient(i_column, i, s_is))

    A[i, :] = A[swap_index, :]
    A[swap_index, :] = i_row

    println("Swap row $i for row $swap_index")

    # Elimination process
    for j in i+1:n
        a_ii = A[i, i] # Pivote
        # println("Pivote $i - $a_ii")
        a_ji = A[j, i]

        m_ji = a_ji / a_ii
        println("Multiplier given by $a_ji / $a_ii")

        new_row = A[j, :] - (m_ji * A[i, :])
        A[j, :] = new_row

        display(A)
    end

    println()
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