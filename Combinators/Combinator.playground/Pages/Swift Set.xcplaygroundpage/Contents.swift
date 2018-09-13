import Foundation

let primes: Set = [2, 3, 5, 7]
let odds: Set = [1, 3, 5, 7, 9]

primes.contains(4)
primes.contains(5)
let y = 10
primes.map{x in x * y}

primes.intersection(odds)
primes.union(odds)
primes.symmetricDifference(odds)
