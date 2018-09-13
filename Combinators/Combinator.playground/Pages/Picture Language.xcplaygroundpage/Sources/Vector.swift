import UIKit

struct Vector {
    let x: CGFloat
    let y: CGFloat
}

extension Vector {
    init(x: Int, y: Int) {
        self.x = CGFloat(x)
        self.y = CGFloat(y)
    }
}

extension Vector {
    var length: CGFloat {
        return sqrt(x * x + y * y)
    }
}

extension Vector {
    static prefix func -(vector: Vector) -> Vector {
        return Vector(x: -vector.x, y: -vector.y)
    }
}
