# package FiniteFields
This package implements finite fields (`FiniteFields`), elements of finite
fields, and modular numbers (`Modulo`). 

Like  GAP3, we only implement finite fields of order less than 2^16. On the
other  hand, `Modulo` implements modular  arithmetic without restriction on
the modulus (the modulus can be a `BigInt`).

The module `Modulo` could be an independent package on its own.
