#tech #kubernetes 

---

[Objects inKubernetes](https://kubernetes.io/docs/concepts/overview/working-with-objects/)
`kubectl` converts the information in **.yaml** to JSON when making the API request.

# Required fields
In the `.yaml` file for the Kubernetes object you want to create, you'll need to set values for the following fields:
- `apiVersion` - Which **version of the Kubernetes API** you're using to create this object
- *kind*
- *metadata*
- *spec*

---
[[Labels and Selectors]]