import Foundation

public let max = 6074
fileprivate let A = 107
fileprivate let C = 1283
fileprivate let M = 6073

public let initialRNG = RNG(seed: 17)

public struct RNG {
    public let seed: Int
    
    public func next() -> (Int, RNG) {
        let newSeed = (seed * A + C) % M
        let nextRNG = RNG(seed: newSeed)
        return (newSeed, nextRNG)
    }
}


