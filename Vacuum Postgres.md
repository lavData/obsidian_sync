#tech #database

---
[Cloud SQL for PostgreSQL - A deep dive into VACUUM FAQs](https://cloud.google.com/blog/products/databases/deep-dive-into-postgresql-vacuum-garbage-collector/)

Relative concept:
[[MVCC]]

PostgreSQL achieves MVCC by creating a new version of a row. Once the updating transaction commits, it makes the new row visible to **all new transactions that start after that point**, while existing transactions **continue see old row**.
⇒ Versioning of specific row
⇛ So many row has dead need to be claim → Use Vacuum

Postgresql keeps track of all these version row by two columns, *xmin* and *xmax*
- *xmin* - defines the transaction id that inserts the tuple.
- *xmax* - defines the transaction id that deletes the tuple.

*xmin* and *xmax* stored fixed size of 4 bytes, so store maximum transactionId 2^32 - 1, approximate 4 bilion transaction to be recycled. If number transaction reach these, Postgres automate vacuum (can control threshold by `autovacum_freeze_max_age` flag).

| Vacuum                                                   | Vacuum Full |
| -------------------------------------------------------- | ----------- |
| Just mark a tuple is dead, can reuse but not claim to OS |  Likewise create new relation, can claim old dead tuple for OS           |


