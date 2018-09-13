public struct State<S, A> {
    public let run: (S) -> (A, S)
    
    public init(run: @escaping (S) -> (A, S)) {
        self.run = run
    }
}

public typealias Rand<A> = State<RNG, A>

extension State {
    public func map<B>(_ transform: @escaping (A) -> B) -> State<S, B> {
        return State<S, B>{s in
            let (nextA, nextS) = self.run(s)
            return (transform(nextA), nextS)
        }
    }
}

extension State {
    public static func pure(_ a: A) -> State<S, A> {
        return State<S, A>{s in (a, s)}
    }
    
    public func flatMap<B>(_ f: @escaping  (A) -> State<S, B>)
        -> State<S, B> {
            return State<S,B>{s in
                let (nextA, nextState) = self.run(s)
                return f(nextA).run(nextState)
            }
    }
}

extension State where S == RNG, A == Int {
    public func nextLessThan(_ upperLimit: Int) -> State<RNG, Int> {
        return flatMap{int in
            guard int < upperLimit else {
                return self.nextLessThan(upperLimit)
            }
            return Rand<Int>.pure(int)
        }
    }
}

extension State {
    public func next(_ n: Int, accumulator: [A] = [A]()) -> State<S, [A]> {
        return flatMap{a in
            guard n > 0 else { return State<S, [A]>.pure(accumulator)
            }
            return self.next(n - 1, accumulator: accumulator + [a] )
        }
    }
}
