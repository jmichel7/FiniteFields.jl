using Documenter, DocumenterMarkdown, FiniteFields, FiniteFields.Modulo

makedocs(sitename="FiniteFields documentation",format=Markdown(),modules=[FiniteFields, FiniteFields.Modulo])
