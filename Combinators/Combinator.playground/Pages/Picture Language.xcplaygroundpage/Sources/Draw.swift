import UIKit

private let view = UIView(frame: CGRect(x: 0, y: 0, width: worldWidth, height: worldHeight))
let pictureLayer = CAShapeLayer()


// TODO: Fix later
public func draw(_ picture: Picture) -> UIView {
    
    let sketch = picture.picture(worldFrame)
    let bigPath = CGMutablePath()
    
    for path in sketch.paths {
        bigPath.addPath(path)
    }
    pictureLayer.lineWidth = 20
    pictureLayer.strokeColor = UIColor.white.cgColor
    pictureLayer.path = bigPath
    
    view.layer.addSublayer(pictureLayer)
//    view.layer.borderWidth = 5
//    view.layer.borderColor = UIColor.red.cgColor
    view.layer.backgroundColor = UIColor.black.cgColor
    return view
}
