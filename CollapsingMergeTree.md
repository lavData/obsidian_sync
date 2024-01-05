#tech #database #clickhouse 

---
# [CollapsingMergeTree](https://clickhouse.com/docs/en/engines/table-engines/mergetree-family/collapsingmergetree#table_engine-collapsingmergetree)

## Collapsing

### Data

- Update operation is expensive and slow for DBMS because it rewriting of the data in storage.
- As we need only the last state of user activity, the rows can be deleted collapsing the invalid state of an object. `ColapsingMergeTree` does this while **merging of the data parts**

### Algorithm
- When CH merges data parts, each group of consecutive rows with the same sorting key (`ORDER BY`) is reduced to not more than two rows, one with `Sign=-1` and another with `Sign=1`. In other words, entires collapse.

- The Sign is required because the merging algorithm does not guarantee that all of the rows with the same sorting key will be in the same resulting data part and even on the same physical server.