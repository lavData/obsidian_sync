#tech #database #clickhouse 

---
# [SummingMergeTree](https://clickhouse.com/docs/en/engines/table-engines/mergetree-family/summingmergetree)

- Inherit from MergeTree.
- Merging data parts replaces all the rows with the same primary key with one row which contains summarized values for the columns with the numeric data type.

## Data Processing
- When data are inserted into a table, they are saved as-is. Merge periodically.
- Merge can be incomplete. Therefore should use aggregate function when use `SELECT`

### Common Rules for Summation
...
- If the values were 0 in all of the columns for summation, the row is deleted.
- 