
<a id='Finite-fields'></a>

<a id='Finite-fields-1'></a>

# Finite fields

<a id='FiniteFields' href='#FiniteFields'>#</a>
**`FiniteFields`** &mdash; *Module*.



This   package  introduces  finite  fields   using  the  GAP  syntex.  This compatibility   with  GAP  is  the  motivation  not  to  use  the  existing `GaloisFields`.  This package has  no dependencies part  from `Primes`. The speed  is comparable with `GaloisFields`,  slightly slower for prime fields and  faster for  composite fields.  Lke GAP3,  we only implements fields of order  less  than  2^16.  This  package  comes  with  the  module  `Modulo` implementing  modular arithmetic  without restriction  on the  modulus (the modulus can be a `BigInt`).

The  Galois field with `p^n` elements is obtained as `GF(p^n)`. Elements of Galois  fields of characteristic `p` have all the same type, the parametric type   `FFE{p}`.  The  function   `Z(p^n)`  returns  a   generator  of  the multiplicative group of `GF(p^n)`. Other elements of `GF(p^n)` are obtained as  powers of `Z(p^n)`, except `0`, obtained as `0*Z(p^n)`. Elements of the prime  field can  also be  obtained as  `FFE{p}(n)` (which  is the  same as n*Z(p)^0`).

```julia-repl
julia> a=Z(64)
FFE{2}: Z₆₄

julia> a^9 # automatic conversion to smaller fields
FFE{2}: Z₈

julia> a^21
FFE{2}: Z₄

julia> a+1
FFE{2}: Z₆₄⁵⁶
```

Elements  of the prime field can be converted to `Mod(,p)` or to integers:

```julia-repl
julia> a=Z(19)+3
FFE{19}: 5

julia> Mod(a)
Mod{UInt64}: 5₁₉

julia> Int(a)
5

julia> order(a) # order as element of the multiplicative group
9
```

The field, `p`, `n` and `p^n` can be obtained back from an `FFE{p}` as well as which power of `Z(p^n)` is considered

```julia-repl
julia> a=Z(8)^5
FFE{2}: Z₈⁵

julia> F=field(a)
GF(2^3)

julia> char(F)
2

julia> char(a)
2

julia> degree(F)
3

julia> degree(a)
3

julia> length(F)
8

julia> log(a)
5

julia> elements(F)
8-element Vector{FFE{2}}:
   0
   1
  Z₈
 Z₈²
 Z₈³
 Z₈⁴
 Z₈⁵
 Z₈⁶
```

A  `p`-integral integer or  rational or a  `Mod(,p)` can be  converted to a prime field element using `FFE{p}` as a constructor.

```julia-repl
julia> FFE{19}(2)
FFE{19}: 2

julia> FFE{19}(5//3)
FFE{19}: 8

julia> FFE{19}(Mod(2,19))
FFE{19}: 2
```

```julia-rep1
julia> m=rand(GF(49),4,4)
4×4 Matrix{FFE{7}}:
 Z₄₉²⁴  Z₄₉¹⁸   Z₄₉⁹  Z₄₉⁴²
 Z₄₉²²  Z₄₉⁴¹  Z₄₉⁴⁶  Z₄₉²⁴
 Z₄₉¹⁵  Z₄₉¹⁹  Z₄₉⁴⁰   Z₄₉³
 Z₄₉²⁰  Z₄₉²⁹  Z₄₉³⁶  Z₄₉²⁰

julia> inv(m)
4×4 Matrix{FFE{7}}:
 Z₄₉³⁷   Z₄₉⁵  Z₄₉³⁶      1
 Z₄₉¹⁰    Z₄₉   Z₄₉⁶  Z₄₉⁴⁷
 Z₄₉³⁰  Z₄₉³⁸    Z₄₉     -2
 Z₄₉¹⁵   Z₄₉²      1  Z₄₉²⁸

julia> inv(m)*m
4×4 Matrix{FFE{7}}:
 1  0  0  0
 0  1  0  0
 0  0  1  0
 0  0  0  1
```

<a id='FiniteFields.FFE' href='#FiniteFields.FFE'>#</a>
**`FiniteFields.FFE`** &mdash; *Type*.



`FFE{p}` is the type of the elements of a finite field of characteristic `p`.

<a id='FiniteFields.FFE-Tuple{Integer}' href='#FiniteFields.FFE-Tuple{Integer}'>#</a>
**`FiniteFields.FFE`** &mdash; *Method*.



`FFE{p}(i)`  for `i` an integer or a fraction with denominator prime to `p` returns the reduction mod `p` of `i`, an element of the prime field `𝔽ₚ`.

<a id='FiniteFields.Z-Tuple{Any}' href='#FiniteFields.Z-Tuple{Any}'>#</a>
**`FiniteFields.Z`** &mdash; *Method*.



`Z(p^d)`

returns  a  generator  of  the  multiplicative  group  of  the finite field `𝔽_{pᵈ}`,  where    `p`  must  be  prime  and `pᵈ` smaller than `2¹⁵`. This multiplicative  group  is  cyclic  thus  `Z(pᵈ)ᵃ`  runs  over it for `a` in `0:pᵈ-1`.  The zero  of the  field is  `0*Z(p)` (the  same as `0*Z(pᵈ)`; we automatically lower an element to the smallest field which contains it).

The  various generators returned by `Z` for finite fields of characteristic `p`  are compatible. That  is, if the  field `𝔽_{pⁿ}` is  a subfield of the field `𝔽_{pᵐ}`, that is, `n` divides `m`, then `Z(pⁿ)=Z(pᵐ)^div(pᵐ-1,pⁿ-1)`.  This is  achieved by  choosing `Z(p)` as the smallest  primitive root  modulo `p`  and `Z(pⁿ)`  as a  root of the `n`-th Conway polynomial of characteristic `p`. Those polynomials where defined by J.H.~Conway and computed by R.A.~Parker.

```julia-repl
julia> z=Z(16)
FFE{2}: Z₁₆

julia> z^5
FFE{2}: Z₄
```


<a id='Modular-numbers'></a>

<a id='Modular-numbers-1'></a>

# Modular numbers

<a id='FiniteFields.Modulo' href='#FiniteFields.Modulo'>#</a>
**`FiniteFields.Modulo`** &mdash; *Module*.



This module introduces modular arithmetic.

The  integer `x` mod. `n` is constructed  by the function `Mod(x,n)`. If `n isa  Int` the result is of type `Mod{UInt64}`. If `n isa BigInt` the result is  of  type  `Mod{BigInt}`.  Since  `n`  is  not  encoded in the type, the elements  `0` and `1` mod.  `n` cannot be constructed  from the type, which causes  some problems for some Julia functionality (for instance `inv` on a matrix does not work). For prime moduli `p`, the type `FFE{p}` in `FiniteFields` does not have such limitations.

Example:

```julia-repl
julia> a=Mod(5,19)
Mod{UInt64}: 5₁₉

julia> a^2
Mod{UInt64}: 6₁₉

julia> inv(a)
Mod{UInt64}: 4₁₉

julia> a*inv(a)
Mod{UInt64}: 1₁₉

julia> a+2
Mod{UInt64}: 7₁₉

julia> a*2
Mod{UInt64}: -9₁₉

julia> a+1//2
Mod{UInt64}: -4₁₉

julia> Integer(a) # get back an integer from a
5

julia> order(a) # multiplicative order of a
9
```

