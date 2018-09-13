f

f.rotate()

f.rotate().rotate()
f.rotate().rotate().rotate()

f.rotate().rotate().rotate().rotate()

f.flipHorizontal()


f.flipVertical()

f.flipVertical().flipHorizontal()

f.flipHorizontal().flipVertical()


f.rotate().flipHorizontal()
f.flipHorizontal().rotate()


f.beside(f)

f.beside(f, ratio: 11, to: 2)

f.beside(f.rotate().rotate(), ratio: 11, to: 2)

f.above(f)

f.above(f, ratio: 9, to: 2)

f.above(f.beside(f))

f.above(blank.beside(f))


f.quad()


f.quad(blank, blank, f)

f.quadRotate()

f.quadFlip()

f.quad(blank, f.rotate(), f).quadFlip().quadRotate().quadRotate()
