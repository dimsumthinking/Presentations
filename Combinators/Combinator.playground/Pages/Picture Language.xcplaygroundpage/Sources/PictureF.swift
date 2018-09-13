import UIKit

public let f = pictureFrom(sketch: fSketch)


fileprivate var fSketch: Sketch {
    let topLeft = CGPoint(x: 0.02, y: 0.02)
    let topRight = CGPoint(x: 0.98, y: 0.02)
    let bottomLeft = CGPoint(x: 0.02, y: 0.98)
    let middleLeft = CGPoint(x: 0.02, y: 0.5)
    let middleRight = CGPoint(x: 0.5, y: 0.5)
    
    let top = UIBezierPath()
    top.move(to: topLeft)
    top.addLine(to: topRight)
    
    let vertical = UIBezierPath()
    vertical.move(to: topLeft)
    vertical.addLine(to: bottomLeft)
    
    let horizontal = UIBezierPath()
    horizontal.move(to: middleLeft)
    horizontal.addLine(to: middleRight)
    
    return Sketch(paths: [top.cgPath, vertical.cgPath, horizontal.cgPath])
    
}
