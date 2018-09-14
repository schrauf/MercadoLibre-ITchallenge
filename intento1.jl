#=
Construir las secuencias explícitamente y contar el numero de alpacas.
=#

N = 234612846789231
M = 123456789

old = "A"

new = ""

function pass(old)
    new = ""
    for c in old
        if c == 'A'
            new *= "AL"
        elseif c == 'L'
            new *= "PACA"
        elseif c == 'P'
            new *= "CP"
        elseif c == 'C'
            new *= "PC"
        end
    end
    return new
end


len = []
nalpaca = []
old = pass(old)

count_alpacas(old) = length(collect(eachmatch(r"ALPACA", old)))

let seq = "A"
for i in 1:30
    seq = pass(seq)
    push!(len, length(seq))
    push!(nalpaca, count_alpacas(seq))
end
end

using Plots; unicodeplots()

plot(len, label = "length", canvas = UnicodePlots.AsciiCanvas)
plot(nalpaca, label = "nalpaca", canvas = UnicodePlots.AsciiCanvas)

# fijate que cada alpaca de una secuencia, fue "generada" por una "A" dos iteraciones antes

seq = "A"
for i in 1:6
    global seq = pass(seq)
end
seq
count_alpacas(seq)

N_alpaca(t) = t<3 ? 0 : N_a(t-2)
N_a(t) = t==1 ? 1 : (N_a(t-1)+2*N_l(t-1))
N_l(t) = t==1 ? 0 : N_a(t-1)

N_alpaca(100)

N = N_real
N = 10

function calc!(NS,T)
    M = 123456789
    @assert length(NS) == 2
    @inbounds for i=1:(T-1)
        NL = NS[2]
        NS[2] = NS[1]
        NS[1] += 2NL
        NS .= mod.(NS,M)
    end
    NS
end
calc(T) = calc!([1,0],T)


calc(N-2)

892923839321889434123687540883334842134504009754611339536458656975292542604113435410998649013079881772995560764627622354322621071410261702998714797891547900327880647902019248785089550421864261823162848512753872915298495105616563963263795328839755242880933039807211847305035819304385365569767139005781

seq = "A"
seq = pass(seq)
 