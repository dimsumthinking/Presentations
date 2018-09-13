
public struct Parser<T> {
    public let parse: (String) -> ParserResult<T>
}

public func run<T>(_ parser: Parser<T>,
                   on string: String) -> ParserResult<T> {
    return  parser.parse(string)
}

public func characterParser(for characterToMatch: Character) -> Parser<Character> {
    return Parser<Character>{string in
        guard let firstChar = string.first else {return .failure("String is empty") }
        if firstChar == characterToMatch {
            return .success(characterToMatch, String(string.dropFirst()))
        } else { return .failure("\(firstChar) from \(string) is not \(characterToMatch)")}
    }
}

extension Parser {
    public func map<U>(_ transform: @escaping (T) -> U) -> Parser<U> {
        return Parser<U>{string in
            self.parse(string).map(transform)
        }
    }
    
    public func followed<U>(by otherParser: Parser<U>) -> Parser<(T,U)> {
        return Parser<(T,U)>{string in
            switch self.parse(string) {
            case .failure(let message):
                return .failure(message)
            case .success(let value, let remain):
                switch otherParser.parse(remain) {
                case .failure(let message):
                    return .failure(message)
                case .success(let innerValue, let innerRemain):
                    return .success((value, innerValue),innerRemain)
                }
            }
        }
    }
    
    public func or(_ otherParser: Parser) -> Parser {
        return Parser{string in
            switch self.parse(string) {
            case .success(let value, let remain):
                return .success(value, remain)
            case .failure(let message):
                switch otherParser.parse(string) {
                case .success(let value, let remain):
                    return .success(value, remain)
                case .failure(let message2):
                    return .failure(message + " and " + message2)
                }
            }
        }
    }
}
