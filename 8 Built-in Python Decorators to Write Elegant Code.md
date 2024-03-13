#tech #note #python 

---
["8 Built-in Python Decorators to Write Elegant Code"](https://www.kdnuggets.com/8-built-in-python-decorators-to-write-elegant-code#:~:text=8%20Built%2Din%20Python%20Decorators%20to%20Write%20Elegant%20Code)

1. @atexit.register
```python
import atexit

# Register the exit_handler function
@atexit.register
def exit_handler():
    print("Exiting the program. Cleanup tasks can be performed here.")

# Rest of the program
def main():
    print("Inside the main function.")
    # Your program logic goes here.

if __name__ == "__main__":
    main()
```
Handle exit function. This case is what doing in the last at program.

2. @dataclasses.dataclass
```python
from dataclasses import dataclass

@dataclass
class Point:
    x: int
    y: int


point = Point(x=3, y=2)
# Printing object
print(point)

# Checking for the equality of two objects
point1 = Point(x=1, y=2)
point2 = Point(x=1, y=2)
print(point1 == point2)
```
Auto implement `__init__` and `__repr__`
3. @enum.unique 
```python
from enum import Enum, unique

@unique
class VehicleType(Enum):
    CAR = 1
    TRUCK = 2
    MOTORCYCLE = 3
    BUS = 4

# Attempting to create an enumeration with a duplicate value will raise a ValueError
try:
    @unique
    class DuplicateVehicleType(Enum):
        CAR = 1
        TRUCK = 2
        MOTORCYCLE = 3
        # BUS and MOTORCYCLE have duplicate values
        BUS = 3
except ValueError as e:
    print(f"Error: {e}")
```
5. @partial
```python
from functools import partial

# Original function
def power(base, exponent):
    return base ** exponent

# Creating a partial function with the exponent fixed to 2
square = partial(power, exponent=2)

# Using the partial function
result = square(3)
print("Output:",result)
```
7. @singledispatch
```python
from functools import singledispatch

# Decorator
@singledispatch
def display_info(arg):
    print(f"Generic: {arg}")

# Registering specialized implementations for different types
@display_info.register(int)
def display_int(arg):
    print(f"Received an integer: {arg}")

@display_info.register(float)
def display_float(arg):
    print(f"Received a float: {arg}")

@display_info.register(str)
def display_str(arg):
    print(f"Received a string: {arg}")

@display_info.register(list)
def display_sequence(arg):
    print(f"Received a sequence: {arg}")

# Using the generic function with different types
display_info(39)             
display_info(3.19)          
display_info("Hello World!")
display_info([2, 4, 6])     
```
Does python is needed ?
8. @classmethod
To indicate this is method is class level.

10. @staticmethod
To operate without property of class 
1. @property