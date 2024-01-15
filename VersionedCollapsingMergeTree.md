#tech #database #clickhouse 

---

# [VersionedCollapsingMergeTree](https://clickhouse.com/docs/en/engines/table-engines/mergetree-family/versionedcollapsingmergetree)

---

# What different with CollapsingMergeTree?
- Allow insert data in any order with multiple threads.
- In particular, the `Version` column helps to collapse the rows properly event if they are inserted in the wrong order.

- `CollapsingMergeTree` allows only strictly consecutive insertion.
