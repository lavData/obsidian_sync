#tech #database 

---
[PostgreSQL: CLUSTER – Improve Index Performance (No default cluster index)](https://www.dbrnd.com/2016/12/postgresql-cluster-improve-index-performance-no-default-cluster-index-explicit-lock-physical-order-data/)

> _If you are Microsoft SQL Server developer, you know that Primary key of the Table is working as Cluster Index and resides in the same data page where data actually stored._

🚫 
> **In PostgreSQL, There is no concept like: Table Primary Key means default Cluster Index of that table.**


💥
When a table is clustered, it is physically reordered based on the index information. Clustering is a one-time operation: when the table is subsequently updated, the changes are not clustered. That is, no attempt is made to store new or updated rows according to their index order. -> Need cluster again again anh again.


🚀
When you execute the CLUSTER command, It creates a temporary copy of the table therefore, you need free space on disk at least equal to the original table size.


👨‍🚀
When an index scan is used, a temporary copy of the table is created that contains the table data in the index order. Temporary copies of each index on the table are created as well. Therefore, you need free space on disk at least equal to the sum of the table size and the index sizes.


---
[CLUSTER - Postgres](https://www.postgresql.org/docs/current/sql-cluster.html)
🆗
However, if you tend to access some data more than others, and there is an index that groups them together, you will benefit from using CLUSTER.

🚫
Clustering a partitioned table clusters each of its partitions using the partition of the specified partitioned index. When clustering a partitioned table, the index may not be omitted.

	