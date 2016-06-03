# distutils: language = c++
# distutils: sources = Rectangle.cpp

cdef extern from "Rectangle.h" namespace "shapes":
    cdef cppclass Rectangle:
        Rectangle() except +
        Rectangle(int, int, int, int) except +
        int x0, y0, x1, y1
        int getArea()
        void getSize(int* width, int* height)
        void move(int, int)

#Cython initializes C++ class attributes of a cdef class using the nullary constructor. 
#If the class you’re wrapping does not have a nullary constructor, 
#you must store a pointer to the wrapped class and manually allocate and deallocate it.        
#
#cdef class PyRectangle:
#    cdef Rectangle* c_rect      # hold a pointer to the C++ instance which we're wrapping
#    def __cinit__(self, int x0, int y0, int x1, int y1):
#        self.c_rect = new Rectangle(x0, y0, x1, y1)
#    def __dealloc__(self):
#        del self.c_rect

cdef class PyRectangle:
    cdef Rectangle c_rect      # hold a C++ instance which we're wrapping
    def __cinit__(self, int x0, int y0, int x1, int y1):
        self.c_rect = Rectangle(x0, y0, x1, y1)    
    def get_area(self):
        return self.c_rect.getArea()
    def get_size(self):
        cdef int width, height
        self.c_rect.getSize(&width, &height)
        return width, height
    def move(self, dx, dy):
        self.c_rect.move(dx, dy)
        
    def x0(self):
        return self.c_rect.x0

    def x1(self):
        return self.c_rect.x1

    def y0(self):
        return self.c_rect.y0

    def y1(self):
        return self.c_rect.y1

    def set_x0(self, x):
        self.c_rect.x0 = x

    def set_x1(self, x):
        self.c_rect.x1 = x

    def set_y0(self, y):
        self.c_rect.y0 = y

    def set_y1(self, y):
        self.c_rect.y1 = y
        
    def what_is(self):
        return "I am a rectangle."