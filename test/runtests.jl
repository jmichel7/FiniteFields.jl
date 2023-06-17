# auto-generated tests from julia-repl docstrings
using Test, FiniteFields
function mytest(file::String,src::String,man::String)
  println(file," ",src)
  omit=src[end]==';'
  src=replace(src,"\\\\"=>"\\")
  exec=repr(MIME("text/plain"),eval(Meta.parse(src)),context=:limit=>true)
  if omit exec="nothing" end
  exec=replace(exec,r" *(\n|$)"s=>s"\1")
  exec=replace(exec,r"\n$"s=>"")
  man=replace(man,r" *(\n|$)"s=>s"\1")
  man=replace(man,r"\n$"s=>"")
  i=1
  while i<=lastindex(exec) && i<=lastindex(man) && exec[i]==man[i]
    i=nextind(exec,i)
  end
  if exec!=man 
    print("exec=$(repr(exec[i:end]))\nmanl=$(repr(man[i:end]))\n")
  end
  exec==man
end
@testset verbose = true "FiniteFields" begin
@testset "FiniteFields.jl" begin
@test mytest("FiniteFields.jl","a=Z(64)","FFE{2}: Z₆₄")
@test mytest("FiniteFields.jl","a^9","FFE{2}: Z₈")
@test mytest("FiniteFields.jl","a^21","FFE{2}: Z₄")
@test mytest("FiniteFields.jl","a+1","FFE{2}: Z₆₄⁵⁶")
@test mytest("FiniteFields.jl","a=Z(19)+3","FFE{19}: 5")
@test mytest("FiniteFields.jl","Mod(a)","Mod{UInt64}: 5₁₉")
@test mytest("FiniteFields.jl","Int(a)","5")
@test mytest("FiniteFields.jl","order(a)","9")
@test mytest("FiniteFields.jl","a=Z(8)^5","FFE{2}: Z₈⁵")
@test mytest("FiniteFields.jl","F=field(a)","GF(2^3)")
@test mytest("FiniteFields.jl","char(F)","2")
@test mytest("FiniteFields.jl","char(a)","2")
@test mytest("FiniteFields.jl","degree(F)","3")
@test mytest("FiniteFields.jl","degree(a)","3")
@test mytest("FiniteFields.jl","length(F)","8")
@test mytest("FiniteFields.jl","log(a)","5")
@test mytest("FiniteFields.jl","elements(F)","8-element Vector{FFE{2}}:\n   0\n   1\n  Z₈\n Z₈²\n Z₈³\n Z₈⁴\n Z₈⁵\n Z₈⁶")
@test mytest("FiniteFields.jl","FFE{19}(2)","FFE{19}: 2")
@test mytest("FiniteFields.jl","FFE{19}(5//3)","FFE{19}: 8")
@test mytest("FiniteFields.jl","FFE{19}(Mod(2,19))","FFE{19}: 2")
@test mytest("FiniteFields.jl","z=Z(16)","FFE{2}: Z₁₆")
@test mytest("FiniteFields.jl","z^5","FFE{2}: Z₄")
end
@testset "Modulo.jl" begin
@test mytest("Modulo.jl","a=Mod(5,19)","Mod{UInt64}: 5₁₉")
@test mytest("Modulo.jl","a^2","Mod{UInt64}: 6₁₉")
@test mytest("Modulo.jl","inv(a)","Mod{UInt64}: 4₁₉")
@test mytest("Modulo.jl","a*inv(a)","Mod{UInt64}: 1₁₉")
@test mytest("Modulo.jl","a+2","Mod{UInt64}: 7₁₉")
@test mytest("Modulo.jl","a*2","Mod{UInt64}: -9₁₉")
@test mytest("Modulo.jl","a+1//2","Mod{UInt64}: -4₁₉")
@test mytest("Modulo.jl","Integer(a)","5")
@test mytest("Modulo.jl","order(a)","9")
end
end
