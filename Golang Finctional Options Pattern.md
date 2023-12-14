#tech #go 

---
# [Golang Functional Options Pattern](https://golang.cafe/blog/golang-functional-options-pattern.html)

How solved with extend configuration options
Basically we have few options:
- Declare new a constructor for each different configuration option
- Define a new Config struct that holds configuration information
- Use the Functional Option Pattern


# Declare new constructor

Use for have very few of change.


# Use a custom Config struct

```go
type Config struct {
  host string
  port int
  timeout time.Duration
  maxConn int
}
```

- Most common

- Issue when we still need to make breaking changes to the structure of our Config