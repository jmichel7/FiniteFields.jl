# FiniteFields
This  package implements finite fields (`FiniteFields`), elements of finite
fields, and modular numbers (`Modulo`) the first two with a GAP3-compatible
syntax.

Like  GAP3, we only implement finite fields of order less than 2^16. On the
other  hand, `Modulo` implements modular  arithmetic without restriction on
the modulus (the modulus can be a `BigInt`).

See the docs for a comparison with `GaloisFields`.

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://jmichel7.github.io/FiniteFields.jl/stable/)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://jmichel7.github.io/FiniteFields.jl/dev/)
[![Build Status](https://github.com/jmichel7/FiniteFields.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/jmichel7/FiniteFields.jl/actions/workflows/CI.yml?query=branch%3Amain)
