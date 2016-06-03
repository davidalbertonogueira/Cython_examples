from rect import PyRectangle
print( "Rectangulo" )
rectangulo = PyRectangle(1,1,2,3)
print( "Size", rectangulo.get_size() )
print( "Area", rectangulo.get_area() )
print( "Self", rectangulo.what_is() )

print(rectangulo.x0())
rectangulo.set_x0(0)
print(rectangulo.x0())

print( "Size", rectangulo.get_size() )
print( "Area", rectangulo.get_area() )
print( "Self", rectangulo.what_is() )

print( "Quadrado" )
class Square(PyRectangle):
    def __init__(self, x0, y0, x1, y1):
        if (y1-x1) != (y0-x0):
            print("This is not a square")
            self.set_x0(0)
            self.set_y0(0)
            self.set_x1(0)
            self.set_y1(0)
    def what_is(self):
        return "I am a square."
            
seraquadrado1 = Square(1,1,2,3)
print( "Size", seraquadrado1.get_size() )
print( "Area", seraquadrado1.get_area() )
seraquadrado2 = Square(1,1,3,3)
print( "Size", seraquadrado2.get_size() )
print( "Area", seraquadrado2.get_area() )
print( "Self", seraquadrado2.what_is() )