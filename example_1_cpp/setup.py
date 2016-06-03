from distutils.core import setup
from Cython.Build import cythonize

setup(
    name = 'Rectangle app',
    ext_modules = cythonize(
           "rect.pyx",                 # our Cython source
           sources=["Rectangle.cpp"],  # additional source file(s)
           language="c++",             # generate C++ code
      ))