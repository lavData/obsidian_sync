#tech #database 

----
# [PostgreSQL: Documentation: 15: 7.5. Sorting Rows (ORDER BY)](https://www.postgresql.org/docs/current/queries-order.html)

0️⃣
>  The NULLS FIRST and NULLS LAST options can be used to determine whether nulls appear before or after non-null values in the sort ordering. By default, null values sort as if larger than any non-null value; that is, NULLS FIRST is the default for DESC order, and NULLS LAST otherwise.

🚧
ORDER BY can be applied to the result of a UNION, INTERSECT, or EXCEPT combination, but in this case it is only permitted to sort by output column names or numbers, not by expressions.kjkki`