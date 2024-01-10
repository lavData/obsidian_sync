#tech #python #thread 

----
# [Python ThreadPool: The Complete Guide](https://superfastpython.com/threadpool-python/)

----
# Python Threads and the Need for Threads Pools

### What Are Python Threads

```python
thread.join()
```

`join` mean that another thread merge to main thread. So all of scripts after this statement is block by process in another thread (that actually is a part of main thread)

❗May cause overhead when have over adhoc sub task → Need **Thread Pool**

### What Are Thread Pools

> The pool is responsible for a fixed number of threads.

> Each thread in the pool is called a worker or a worker thread.

> Python provides a thread pool via the **ThreadPool** class.

## ThreadPool Class in Python

...