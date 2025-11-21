using Documenter, FiniteFields

DocMeta.setdocmeta!(FiniteFields, :DocTestSetup, :(using FiniteFields); recursive=true)

makedocs(sitename="FiniteFields and Modulo documentation",
    modules=[FiniteFields,Modulo],
    authors="Jean Michel <jean.michel@imj-prg.fr> and contributors",
    format=Documenter.HTML(;
        canonical="https://jmichel7.github.io/FiniteFields.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
    "index.md",
    "finitefields.md",
    "modulo.md",
    ],
    warnonly=:missing_docs,
)

deploydocs(;
    repo="github.com/jmichel7/FiniteFields.jl",
    devbranch="main",
)
