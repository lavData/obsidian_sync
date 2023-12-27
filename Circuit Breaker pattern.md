#design-pattern #tech 

---

# [Circuit Breaker pattern](https://learn.microsoft.com/en-us/azure/architecture/patterns/circuit-breaker#issues-and-considerations)

## Context and problem

- What happen with request make the remote resources and services fail?
	- But those request take much longer to fix.
		- Should we do retry?

## Solution?

> The Circuit Breaker pattern, popularized by Michael Nygard in his book, [Release It!](https://pragprog.com/titles/mnee2/)

→ Prevent an applications from **repeatedly trying to execute and operation that's likely to fail**

⇒ Can we call this like Retry pattern with handle request with expect to fail. Otherwise,  Retry pattern handle request with expect to pass.

![[Pasted image 20231227154648.png]]

- **Closed**:
	- Open for any request. Responsibility is likely a proxy.
		- Count number recent failures  → if exceed threshold within a given time → **Open** state
		- If have fail but not exceed yet → **Half-Open** state. 
- **Open**: Deny all request and return exception.
- **Half-Open**: If not fail → **Closed**, otherwise → **Open**

---
