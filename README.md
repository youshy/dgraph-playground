# Dgraph playground

Notes and findings about Dgraph db.

## Functions and filtering

This are the basic ones and the mostly used (provided in [tour.dgraph.io](https://tour.dgraph.io/basic/6/)

* `allOfTerms(edge_name, "term1 ... termN")` - matches node with an outgoing `string` edge `edge_name` where the string contains all listed terms

* `anyOfTerms(endge_Name, "term1 ... termN)` - same as above, but matches at least one term

* Equalities and inequalities that can be applied ot edges of types: `int`, `float`, `string` and `date`:

    * `eq(edge_name, value)` - equal to
    * `ge(edge_name, value)` - greater than or equal to
    * `le(edge_name, value)` - less than or equal to
    * `gt(edge_name, value)` - greater than
    * `lt(edge_name, value)` - less than
