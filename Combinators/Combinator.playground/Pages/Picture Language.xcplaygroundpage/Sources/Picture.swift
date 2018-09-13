import UIKit


public struct Picture {
    let picture: (PictureFrame) -> Sketch
}
extension Picture {
    public func rotate() -> Picture {
        return Picture{frame in
            self.picture(frame).rotateAbout(Vector(x: frame.edge1.length/2, y: frame.edge2.length/2), by: -CGFloat.pi/2)
        }
    }
    
    public func flipHorizontal() -> Picture {
        return Picture{frame in
            self.picture(frame).scale(x: -1, y: 1).translate(by: Vector(x:frame.edge1.length, y: 0))
        }
    }
    
    public func flipVertical() -> Picture {
        return Picture{frame in
            self.picture(frame).scale(x: 1, y: -1).translate(by: Vector(x: 0, y: frame.edge2.length))
        }
    }
    
    public func beside(_ otherPicture: Picture, ratio leftRatio: Int = 1, to rightRatio: Int = 1) -> Picture {
        return Picture {frame in
            let sum = CGFloat(leftRatio + rightRatio)
            return self.picture(frame).scale(x: CGFloat(leftRatio)/sum, y: 1) +
                otherPicture.picture(frame).scale(x: CGFloat(rightRatio)/sum, y: 1).translate(by: Vector(x: frame.edge1.length * CGFloat(leftRatio)/sum, y: 0))
            
        }
    }
    
    public func above(_ otherPicture: Picture, ratio topRatio: Int = 1, to bottomRatio: Int = 1) -> Picture {
        return Picture {frame in
            let sum = CGFloat(topRatio + bottomRatio)
            return self.picture(frame).scale(x: 1, y: CGFloat(topRatio)/sum) +
                otherPicture.picture(frame).scale(x: 1, y: CGFloat(bottomRatio)/sum).translate(by: Vector(x: 0, y: frame.edge2.length * CGFloat(topRatio)/sum))
            
        }
    }
    
    public func quad(_ b: Picture, _ c: Picture, _ d: Picture) -> Picture {
        return (self.beside(b)).above(c.beside(d))
    }
    
    public func quad() -> Picture {
        return quad(self, self, self)
    }
    
    public func quadRotate(_ b: Picture, _ c: Picture, _ d: Picture) -> Picture {
        return quad(b.rotate().rotate().rotate(), c.rotate(), d.rotate().rotate())
    }
    
    public func quadRotate() -> Picture {
        return quadRotate(self, self, self)
    }
    
    public func quadFlip() -> Picture {
        return quad(flipHorizontal(), flipVertical(), flipVertical().flipHorizontal())
    }
    
    
}

func pictureFrom(sketch: Sketch) -> Picture {
    return Picture {frame in
        sketch
            .scale(x: frame.edge1.length, y: frame.edge2.length)
            .translate(by: frame.origin)
    }
}

extension Picture: CustomPlaygroundDisplayConvertible {
    public var playgroundDescription: Any {
        return draw(self)
    }
}
