#python #tech 

----
# [Python Async: Master Asynchronous Programing](https://ioflood.com/blog/python-async/#:~:text=The%20async%20keyword%20in%20Python,wait%20for%20it%20to%20finish.)

# Basics

`async` function is a special kind of function that can be paused and resume, allowing Python to handle other tasks in the meantime.

`await` used inside an async function to call another async function and wait for it to finish.
a

---
["Async IO in Python: A Complete Walkthrough"](https://realpython.com/async-io-python/#:~:text=the%20asyncio%20Module-,Async%20IO%20in%20Python%3A%20A%20Complete%20Walkthrough,-by%20Brad%20Solomon)

## [The 10,000-Foot View of Async IO](https://realpython.com/async-io-python/#the-10000-foot-view-of-async-io "Permanent link")

**Parallelism** consists of performing multiple operations at the same time.
**Concurrency** is a slightly broader term than parallelism. It suggest that multiple tasks have the ability to run in an overlapping manner.

> Over the last few years, a separate design has been more comprehensively built into [CPython](https://realpython.com/cpython-source-code-guide/): asynchronous IO

> However, async IO is not threading, nor is it multiprocessing. It is not built on top of either of these.

> In fact, async IO is a single-threaded, single-process design: it uses **cooperative multitasking**, ...  It has been said in other words that async IO gives a feeling of concurrency despite using a single thread in a single process.

![[Pasted image 20240314000631.png]]

> So, cooperative multitasking is a fancy way of saying that a program’s event loop (more on that later) communicates with multiple tasks to let each take turns running at the optimal time.

## The `asyncio` Package and `async`/`await`

> At the heart of async IO are coroutines. A coroutine is a specialized version of a Python generator function. Let’s start with a baseline definition and then build off of it as you progress here: a coroutine is a function that can suspend its execution before reaching `return`, and it can indirectly pass control to another coroutine for some time.


Just await and awaitable object. An awaitabe object is either another corountine or an object defining an  `___await___()` returns an iterator. Should only need to worry about case another corountine

❓Why `async` and `await` is analogous of generator
>One critical feature of generators as it pertains to async IO is that they can effectively be stopped and restarted at will. For example, you can `break` out of iterating over a generator object and then resume iteration on the remaining values later. When a [generator function reaches `yield`](https://realpython.com/introduction-to-python-generators/), it yields that value, but then it sits idle until it is told to yield its subsequent value.

## [Other Features: `async for` and Async Generators + Comprehensions](https://realpython.com/async-io-python/#other-features-async-for-and-async-generators-comprehensions "Permanent link")

If want to yield inside async def
```python
>>> async def mygen(u: int = 10):
...     """Yield powers of 2."""
...     i = 0
...     while i < u:
...         yield 2 ** i
...         i += 1
...         await asyncio.sleep(0.1)
```

```python
>>> async def main():
...     # This does *not* introduce concurrent execution
...     # It is meant to show syntax only
...     g = [i async for i in mygen()]
...     f = [j async for j in mygen() if not (j // 3 % 5)]
...     return g, f
...
>>> g, f = asyncio.run(main())
>>> g
[1, 2, 4, 8, 16, 32, 64, 128, 256, 512]
>>> f
[1, 2, 16, 32, 256, 512]
```

# The Event Loop and `asyncio.run()`

> You can think of an event loop as something like a `while True` loop that monitors coroutines, taking feedback on what’s idle, and looking around for things that can be executed in the meantime. It is able to wake up an idle coroutine when whatever that coroutine is waiting on becomes available.

```python
asyncio.run(main()) # Python 3.7+
```


# A Full Progam: Asynchronous Request