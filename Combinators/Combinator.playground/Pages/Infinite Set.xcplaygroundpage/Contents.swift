struct IntSet {
    let contains: (Int) -> Bool
}

extension IntSet {
    init(withRangeFrom lower: Int, to upper: Int) {
        contains = {x in
            (x >= lower) && (x <= upper)
        }
    }
    
    init(_ elements: Int ...) {
        contains = {x in
            elements.contains(x)
        }
    }
}

extension IntSet: CustomStringConvertible {
    var description: String {
        return [Int](-10 ... 10).filter{x in contains(x)}.description
    }
}

extension IntSet {
    func union(_ otherSet: IntSet) -> IntSet {
        return IntSet{x in
            (self.contains(x) || otherSet.contains(x))
        }
    }
    
    func intersection(_ otherSet: IntSet) -> IntSet {
        return IntSet{ x in
            (self.contains(x) && otherSet.contains(x))
        }
    }
    var complement:  IntSet {
        return IntSet{x in !self.contains(x)}
    }
    
    func minus(_ setToBeRemoved:  IntSet) -> IntSet {
        return self.intersection(setToBeRemoved.complement)
    }
    
    func symmetricDifference(with otherSet: IntSet) -> IntSet {
        return self.union(otherSet).minus(self.intersection(otherSet))
    }
}

extension IntSet {
    
    func add(_ element: Int) -> IntSet {
        return IntSet{x in
            self.contains(x) || x == element
        }
    }
    
    func remove(_ element: Int) -> IntSet {
        return IntSet{ x in
            self.contains(x) && x != element
        }
    }
}

let evens = IntSet(){x in
    x % 2 == 0
}

evens.description
evens.contains(-400)
evens.contains(1013)

let twoThreeFour = IntSet(withRangeFrom: 2, to: 4)
let primes = IntSet(2, 3, 5, 7)


let emptySet = IntSet()
emptySet
let universalSet = IntSet(contains: {(_) in return true})
universalSet






twoThreeFour.union(primes)
twoThreeFour.intersection(primes)
twoThreeFour.complement
twoThreeFour.minus(primes)
twoThreeFour.symmetricDifference(with: primes)

let addSeven = twoThreeFour.add(7)
let removeSeven = addSeven.remove(7)
let addSevenAgain = removeSeven.add(7)



