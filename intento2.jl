#=
Contar el número de As dos iteraciones antes de la última,
sin construir la secuencia.
=#

N = 234612846789231
M = 123456789

function calc!(NS,T)
    M = 123456789
    @assert length(NS) == 2
    @inbounds for i=1:(T-1)
        (i % 1_000_000) == 0 && println(i)
        NL = NS[2]
        NS[2] = mod(NS[1],M)
        NS[1] = mod(NS[1]+2NL,M)
    end
    NS
end
calc(T) = calc!([1,0],T)

N_alpacas(T) = T<3 ? 0 : calc(T-2)[1]

respuesta = N_alpacas(N)
