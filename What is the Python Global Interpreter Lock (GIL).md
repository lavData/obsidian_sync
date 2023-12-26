#tech #python 

---
# [What is the Python Global Interpreter Lock?](https://kjrealpython.com/python-gil/)

- GIL is a [[Mutex]] allow only one thread.
- GIL can make bottleneck in CPU-bound and multi-threaded code

- GIL can make program avoid race conditions where two threads increase or decreease value simultaneously.


# Why was the GIL Chosen as the Solution?

Because the C libraries that python depend use an extensions required a thread-safe memory management which the GIL provided.

# Why hasn't the GIL been remove yet?

Because difficult.

# How to Deal With Python's GIL

[[Multi-processing]]