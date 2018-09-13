import UIKit



public let pictureWidth = 800
public let pictureHeight = 200

public let pictureFrame = CGRect(x: (worldWidth - pictureWidth)/2, y: (worldHeight - pictureHeight)/2, width: pictureWidth, height: pictureHeight)

public let worldWidth = 1000
public let worldHeight = 1000

public let worldFrame = PictureFrame(origin: Vector(x: 0, y: 0),
                                     edge1: Vector(x: worldWidth, y: 0),
                                     edge2: Vector(x: 0, y: worldHeight))



