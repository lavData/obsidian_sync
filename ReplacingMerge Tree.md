#tech #database #clickhouse

---
# [ReplacingMerge Tree](https://clickhouse.com/docs/en/engines/table-engines/mergetree-family/replacingmergetree)

- Remove duplicate entries with the same SORTING KEY, value in `ORDER BY`

- Running in background at an unknown time, so can't plant for it. 


## ReplacingMergeTree Parameters

**ver**
- If ver not set → get the latest record been inserted.
- If ver specified, get the maximum version

**is_deleted** 
> So weird, why this engine can be delete just by field name? Have many case with vary field name.

