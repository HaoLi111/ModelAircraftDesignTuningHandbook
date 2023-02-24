using Symbolics

@variables α α0 Cl_α Cd_0 Cd_if

Cl = Cl_α * (α - α0)
Cd = Cd_0 + Cd_if * Cl^2



Symbolics.solve_for(Cl,α)

# angle of attach for minimum drag
Dα = Differential(α)
eq1 = Dα(Cd)

Symbolics.solve_for(expand_derivatives(eq1),α)

# angle of attack for maximum lift to drag ratio

κ = Cl/Cd #kappa

κ2 = substitute(κ, Dict(α0 => 0))


dκdα = Differential(α)(κ2)

Cd2 = substitute(Cd,Dict(α0 => 0))

eq = expand_derivatives(dκdα) * Cd2^2 

eq = simplify(eq)


Symbolics.solve_for(eq,α^2)

α_κ_max = sqrt(Symbolics.solve_for(eq,α^2))
