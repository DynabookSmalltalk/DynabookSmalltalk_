rules
fact 0 = [1],
fact _:n = fact(n - 1):m -> [n * m]

// this example shows that rules can have multiple definitions (they are tried in order)
