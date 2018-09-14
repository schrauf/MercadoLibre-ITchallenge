#=
El número de As sigue una recursión lineal de segundo orden
así que usé los resultados del trabajo https://arxiv.org/pdf/1610.06376.pdf
modificado para su uso en aritmética modular.

Como paso intermedio se generó una secuencia de Lucas ;)
=#

const c_N = 234612846789231
const c_M = 123456789

using Mods

function Lucas(P,Q)
    M = Mod.([P -Q; 1 0], c_M)
    C = Mod.([1 P; 0 2], c_M)
    U(k) = M^k*C
    return U
end

function W(A,B,P,Q)
    U = Lucas(P,Q)
    function W(k)
         Uk1,Uk0 = U(k-1)
         B*Uk1-A*Q*Uk0
    end
    return W
end

N_a = W(1,1,1,-2)

N_a(c_N - 2)
