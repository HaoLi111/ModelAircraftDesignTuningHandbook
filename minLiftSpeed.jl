using Symbolics

@variables Fd S v rho θ Ft Fg κ




Fl = κ * Fd
#orthorgonal decompose
eq1 = Fg * cos(θ) - Fl



eq2 = Fg* sin(θ) -(Ft - Fd)

Ft2 = Symbolics.solve_for(eq2, Ft)

Fd2 = Symbolics.solve_for(eq1, Fd)

Ft3 = substitute(Ft2,Dict(Fd=>Fd2))

dFtDθ = Differential(θ)(simplify(Ft3))

dFtDθ = expand_derivatives(dFtDθ)

cot = simplify(Symbolics.solve_for(dFtDθ,cos(θ)) / sin(θ))
#when tan(θ) = κ, it need max Ft



