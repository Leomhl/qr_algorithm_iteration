A = randn(8,8)


########################################################


using LinearAlgebra

# Algoritmo qr 
for k = 1:1000
    Q, R = qr(A)
    A = R*Q
end


show(stdout, "text/plain", A)


# Aplica uma tolerância de erro (1e-10) tal que substitua valores menores que ela por 0

println()
println("Tolerânciaa de erro")
println()

for linha = 1:size(A)[1]
    for coluna = 1:size(A)[2]
        if(abs(A[linha, coluna]) < 1e-10)
            A[linha, coluna] = 0.0
        end 
    end
end

show(stdout, "text/plain", A)

########################################################

# Trabalhando com Autovalores simétricos
A_simetrica = (A + A') / 2


for k = 1:100
    Q, R = qr(A_simetrica)
    A_simetrica = R*Q
end

show(stdout, "text/plain", A_simetrica)

########################################################

# Aplica uma tolerância de erro (1e-10) tal que substitua valores menores que ela por 0

for linha = 1:size(A_simetrica)[1]
    for coluna = 1:size(A_simetrica)[2]
        if(abs(A_simetrica[linha, coluna]) < 1e-10)
            A_simetrica[linha, coluna] = 0.0
        end 
    end
end

show(stdout, "text/plain", A_simetrica)
