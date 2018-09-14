#=
Construir las secuencias explícitamente y contar el numero de alpacas.
=#

N = 234612846789231
M = 123456789

function pass(seq)
    newseq = ""
    for c in seq
        if c == 'A'
            newseq *= "AL"
        elseif c == 'L'
            newseq *= "PACA"
        elseif c == 'P'
            newseq *= "CP"
        elseif c == 'C'
            newseq *= "PC"
        end
    end
    return newseq
end


len = []
nalpaca = []

count_alpacas(seq) = length(collect(eachmatch(r"ALPACA", seq)))

let seq = "A"
for i in 1:10
    seq = pass(seq)
    push!(len, length(seq))
    push!(nalpaca, count_alpacas(seq))
end
end
