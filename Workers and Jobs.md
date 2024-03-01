#tech #airbyte

---
# [Workers & Jobs](https://docs.airbyte.com/understanding-airbyte/jobs)

Downsides:
- Any issues to parent worker process affects all job processes launched by the worker.
- Unnecessary complexity of vertically scaling the worker process to deal with IO and processing requirements from multiple jobs.

⇒ The Container Orchestrator was introduced to solved this.


#### Container Orchestrator 

When enabled, workers launch the Container Orchestrator process.
The worker process delegates the responsibility to the orchestrator process.



