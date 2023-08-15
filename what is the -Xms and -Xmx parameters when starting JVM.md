#tech  #java 

---
# [What are the -Xms and -Xmx parameters when starting JVM?](https://stackoverflow.com/questions/14763079/what-are-the-xms-and-xmx-parameters-when-starting-jvm)

> The flag `Xmx` specifies the maximum memory allocation pool for a Java Virtual Machine (JVM), while `Xms` specifies the initial memory allocation pool.

This means that your JVM will be started with `Xms` amount of memory and will be able to use a maximum of `Xmx` amount of memory. For example, starting a JVM like below will start it with 256 MB of memory and will allow the process to use up to 2048 MB of memory:

```java
java -Xms256m -Xmx2048m
```

The memory flag can also be specified in different sizes, such as kilobytes, megabytes, and so on.

```java
-Xmx1024k
-Xmx512m
-Xmx8g
```

The `Xms` flag has no default value, and `Xmx` typically has a default value of 256 MB. A common use for these flags is when you encounter a `java.lang.OutOfMemoryError`