using Symbolics

@variables Cl Cd S v rho θ Ft Fg

q = 1/2 *rho * v^2


Fl = q * S * Cl
Fd = q * S * Cd


simplify(Fl / Fd)



eq = (Ft - Fd) - Fg * sin(θ)
