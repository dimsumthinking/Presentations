public enum ParserResult<Value> {
    case success(Value, String)
    case failure(String)
}

extension ParserResult: CustomStringConvertible where Value: CustomStringConvertible {
    public var description: String {
        switch self {
        case .failure(let message):
            return "failure: " + message
        case .success(let value, let remaining):
            return "success: \(value), \(remaining)"
        }
    }
}

extension ParserResult {
    public func map<Output>(_ transform: (Value) -> Output) -> ParserResult<Output> {
        switch self {
        case .failure(let message):
            return .failure(message)
        case .success(let value, let remaining):
            return .success(transform(value), remaining)
        }
    }
    public func flatMap<Output>(_ transform: (Value) -> ParserResult<Output>) -> ParserResult<Output> {
        switch self {
        case .failure(let message):
            return .failure(message)
        case .success(let value, _):
            return transform(value)
        }
    }
}
