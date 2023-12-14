#tech #go 

---

```go
package main

import (
 "context"
 "fmt"
 "time"
)

func main() {
 ctx, cancel := context.WithCancel(context.Background())

 go performTask(ctx)

 time.Sleep(2 * time.Second)
 cancel()

 time.Sleep(1 * time.Second)
}

func performTask(ctx context.Context) {
 for {
  select {
  case <-ctx.Done():
   fmt.Println("Task cancelled")
   return
  default:
   // Perform task operation
   fmt.Println("Performing task...")
   time.Sleep(500 * time.Millisecond)
  }
 }
}
```

# Why need use `time.Sleep(1 * time.Second` 
Make sure the goroutine has exit before main goroutine, if not use synchronize, the program may exit before the have a chance to complete their work.
