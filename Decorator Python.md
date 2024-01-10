#tech #python 

---
# [Decorators in Python](https://www.geeksforgeeks.org/decorators-in-python/)

---

```python
# Python program to illustrate functions 
# Functions can return another function 

def create_adder(x): 
	def adder(y): 
		return x+y 

	return adder 

add_15 = create_adder(15) 

print(add_15(10)) 
```

If we return `adder(y)` in `creat_adder(x)` , simply we have adder(y) 😆, but more we have the value of variables has been create by above wrapper. In this sample, we return adder(y)