import Foundation
import CoreGraphics

struct Sketch {
    let paths: [CGPath]
}

extension Sketch {
    func translate(by vector: Vector) -> Sketch {
        return transform(using: CGAffineTransform(translationX: vector.x, y: vector.y))
    }
    func scale(x: CGFloat, y: CGFloat) -> Sketch {
        return transform(using: CGAffineTransform(scaleX: x, y: y))
    }
    
    func rotate(by angle: CGFloat) -> Sketch {
        return transform(using: CGAffineTransform(rotationAngle: angle))
    }
    
    func rotateAbout(_ vector: Vector, by angle: CGFloat) -> Sketch {
        return translate(by: -vector).rotate(by: angle).translate(by: vector)
    }
    
    //    func flipX() -> Sketch {
    //
    //    }
    
    
}

extension Sketch {
    private func transform(using affineTransform: CGAffineTransform) -> Sketch {
        var transformedPaths = [CGPath]()
        var affineTransform = affineTransform
        for path in paths {
            if let transformedPath = path.copy(using: &affineTransform) {
                transformedPaths.append(transformedPath)
            } else {print("failed to add path")}
        }
        return Sketch(paths: transformedPaths)
    }
}

func+(lhs: Sketch, rhs: Sketch) -> Sketch {
    return Sketch(paths: lhs.paths + rhs.paths)
}
