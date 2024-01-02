#tech #clickhouse #database 



---
# [MergeTree](https://clickhouse.com/docs/en/engines/table-engines/mergetree-family/mergetree)

## Data Storage
- The merge mechanism does not guarantee that all rows with the same primary key will be in the same data part.
	- Have two mode, `Wide` and `Compact`. `Wide`  stored in a separate file in a filesystem. `Compact` stored in one file.
- Granule is the smallest indivisible that CH reads when selecting data.


# Primary Keys and Indexes in Queries
# Selecting the Primary Key

Number of columns in the primary key is not explicitly limited. Can include more or fewer columns in the primary key. This may:
- Improve the performance of an index.
	  If the primary key is `(a, b)`, then adding another column `c` will improve the performance if the following conditions are met:
	- There are queries with a condition on column `c`.
	- Long data ranges → will skip long data ranges.
- Improve data compression. → CH sorted.

## Primary Key that Differs Sorting Key
 