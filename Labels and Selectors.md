#kubernetes  #tech 

---

[Labels and Selectors](https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/)

# Label

> Labels are intended to be used to specify identifying attributes of objects that are meaningful and relevant to users, but do not directly imply semantics to the core system

	→ Just use to organizational


Ex: 
```json
"metadata": {
  "labels": {
    "key1" : "value1",
    "key2" : "value2"
  }
}
```

# Selector
Selector is an action to filter by label.

There two type of selector is **equality-based** and **set-based**

**Equality-based**: is use by three operator `=`,`==`,`!=`
**Set-based**: is use by three operator `in`,`notin` and `exists`
Two above type can use mixed
![[Pasted image 20230711120628.png]]