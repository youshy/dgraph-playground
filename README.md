# Dgraph playground

Notes and findings about Dgraph db.

## Filtering

This are the basic ones and the mostly used (provided in [tour.dgraph.io](https://tour.dgraph.io/basic/6/)

* `allOfTerms(edge_name, "term1 ... termN")` - matches node with an outgoing `string` edge `edge_name` where the string contains all listed terms

* `anyOfTerms(endge_Name, "term1 ... termN)` - same as above, but matches at least one term

* Equalities and inequalities that can be applied on edges of types: `int`, `float`, `string` and `date`. To use any of these, prepend the name of the node with `@filter`

    * `eq(edge_name, value)` - equal to
    * `ge(edge_name, value)` - greater than or equal to
    * `le(edge_name, value)` - less than or equal to
    * `gt(edge_name, value)` - greater than
    * `lt(edge_name, value)` - less than

* Any logical connectives - `AND`, `OR`, `NOT` are used to bind two (or more) filter types

* `count(edge_type)` - returns the count of all edges

* `has(edge_name)` - returns nodes that have an outgoing edge of the given name

* By using `:` we can set the alias for the return node. Eq: 

```
{
  michael_number_friends(func: allofterms(name, "Michael")) {
    persons_name : name
    age
    number_of_friends : count(friend)
  }
}
```

* `@cascade` - removes any nodes that don't have all matching edges in the query

## Sorting

By default, query answers are ordered by `uid`. But if you want to sort them, it's easy - `orderasc` and `orderdesc` and adding the `type` on which it has to be ordered. Eq - `(orderasc: age)`. Ordering affects JSON only, the visualization (if using Ratel) will stay the same.

## Pagination

Pagination can be combined with ordering and with each other:

  * `first: N` - return only the first `N` results
  * `offset: N` - skip the first `N` results
  * `after: uid` - return the results after `uid`

## Search

Every query has to have a starting (root) node from which it'll expand the search. We can define the root node with `func:`. For example - find all people who are in their 20s, and have at least 2 friends:

```
{
  lots_of_friends(func: ge(count(friend), 2)) @filter(ge(age, 20) AND lt(age, 30)) {
    name@.
    age
    friend {
      name@.
    }
  }
}
```

Breaking down - `func` accepts only a single function and doesn't accept any connectives or filters. If the root nodes have to be filtered, they need to use `@filter`.

## Other

* Anything after `#` on a line is a comment and ignored for query processing
