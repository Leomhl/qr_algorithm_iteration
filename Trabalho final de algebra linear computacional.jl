# Executar na linha de comando antes de executar esse notebook
# import Pkg; Pkg.add("Colors"); Pkg.add("Plots");

using Colors, Plots

A = randn(8,8)


########################################################


# Plotando a matriz A, podemos observar como ela se comporta
heatmap(A, yflip=true)


########################################################


using LinearAlgebra

# Algoritmo qr 
for k = 1:1000
    Q, R = qr(A)
    A = R*Q
end


show(stdout, "text/plain", A)

########################################################

# Plot da matriz
heatmap(A, yflip=true)

########################################################

# Aplica uma tolerância de erro (1e-10) tal que substitua valores menores que ela por 0

for linha = 1:size(A)[1]
    for coluna = 1:size(A)[2]
        if(abs(A[linha, coluna]) < 1e-10)
            A[linha, coluna] = 0.0
        end 
    end
end

show(stdout, "text/plain", A)

########################################################

# Plot da matriz
heatmap(A, yflip=true)

########################################################

# Trabalhando com Autovalores simétricos
A_simetrica = (A + A') / 2

########################################################

# Visualizando o que mudou da A para A_Simetrica
heatmap(A_simetrica, yflip=true)

########################################################

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

########################################################

heatmap(A_simetrica, yflip=true)

########################################################

matriz_identidade = Matrix{Float64}(I, 8, 8)
A = randn(Float64, (8,8))

show(stdout, "text/plain", matriz_identidade)

# Serve apenas para melhorar a visualização
println();println()

# Insere 2 linhas da matriz identidade para tornarmos a matriz A retangular
A = [A[1:4,:]; matriz_identidade[1,:]'; A[5:8,:]; matriz_identidade[2,:]']

show(stdout, "text/plain", A)

########################################################

heatmap(A, yflip=true)
