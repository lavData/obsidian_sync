#tech  #python  

---

# [An Intro to Threading in Python](https://realpython.com/intro-to-python-threading/)

---

> Tasks that spend much of their time waiting for external events are generally good candidates for threading. 

⇒ Not good for any cases require heavy CPU.

### [Daemon Threads](https://realpython.com/intro-to-python-threading/#daemon-threads "Permanent link")

> In computer science, a [`daemon`](https://en.wikipedia.org/wiki/Daemon_(computing)) is a process that runs in the background.
> A `deamon` thread will shut down immediately when the program exits.


## [Race Conditions](https://realpython.com/intro-to-python-threading/#race-conditions "Permanent link")

Is multiple thread point to one resource.

## [Basic Synchronization Using `Lock`](https://realpython.com/intro-to-python-threading/#basic-synchronization-using-lock "Permanent link")

> Allow only one thread at a time into the read-modify-write

> The most common way to do this is called [[Lock]] in Python. In some other languages this same idea is called a [[Mutex]]

Python's Lock will also operate as a [[Context manager]]

```python
class FakeDatabase:
    def __init__(self):
        self.value = 0
        self._lock = threading.Lock()

    def locked_update(self, name):
        logging.info("Thread %s: starting update", name)
        logging.debug("Thread %s about to lock", name)
        with self._lock:
            logging.debug("Thread %s has lock", name)
            local_copy = self.value
            local_copy += 1
            time.sleep(0.1)
            self.value = local_copy
            logging.debug("Thread %s about to release lock", name)
        logging.debug("Thread %s after release", name)
        logging.info("Thread %s: finishing update", name)
```
