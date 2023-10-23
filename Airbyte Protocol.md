#tech  #data-zone 


---
[Airbyte Protocol](https://docs.airbyte.com/understanding-airbyte/airbyte-protocol)

3️⃣
Each method in the protocol has 3 parts:

- Input: these are the arguments passed to the method.
- Data Channel Egress (Output): all outputs from a method are via STDOUT. While some method signatures declare a single return value, in practice, any number of AirbyteLogMessages and AirbyteTraceMessages may be emitted. An actor is responsible for closing STDOUT to declare that it is done.
- Data Channel Ingress: after a method begins running, data can be passed to it via STDIN. For example, records are passed to a Destination on STDIN so that it can load them into a data warehouse.

**Sources are a special case and do not have a Data Channel Ingress.**

> Messages not wrapped in the AirbyteMessage must be dropped (e.g. not be passed from Source to Destination). However certain implementations of the Airbyte Protocol may choose to store and log unknown messages for debugging purposes.


# Schema Mismatches
|Scenario |Outcome   |
|---|---|
|Field exists in data store but not in catalog|When the source runs, it never looks for the field in the store. It should not emit that field. If it does, it should be ignored downstream. The existence of an unknown field should not cause a failure.|

---
🔄
[[Incremental syncs]]
Concept: syncs that only replicate data that is new since the previous sync.

----
# V1
State for an actor is emitted as a complete black box.

---
# V2
Stream: isolate state for each stream with another
Global: want to share infor of all state in one object
Legacy: black box

> Stream-Level Replication Isolation means that a Source could be run in ***parallel*** by splitting up its streams across running instances.
❓How to parallel?

---

# Messages
To forwards compatibility all messages should allow for unknown properties → `additionalProperties: true`
