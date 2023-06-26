# <mark style="background: #FFB8EBA6;">1.6 Database engine</mark>
## 1.6.1 Store Manager
Thus, the storage manager is responsible for storing, retrieving, and updating data in the database.
## 1.6.2 The Query Processor
- **DDL Interpreter**
- **DML compiler**: Query can be translated into any of number of alternative evaluation plans that all **gives the same result**. Use **query optimizations**
- **Query evaluation engine**: executes low-level instruction by the DML compiler
---

# <mark style="background: #FF5582A6;">1.7 Database and Application Architecture</mark>
![[Pasted image 20230624201453.png]]
- Two-tier architecture is old database.
- Three-tier architecture is modern database because the <mark style="background: #FFB86CA6;">merely of web and mobile app</mark> 
![[Pasted image 20230624202501.png]]

---

# <mark style="background: #ABF7F7A6;">1.9 History of Database Systems</mark>
**Late 1960s and early 1970s**: Widespread use of hard disks in the late 1960s changed the scenario for data processing greatly
...
**2000s**: The types of data stored in database systems evolved rapidly during this period. Semi-structured data became increasingly important. XML emerged as a data-exchange standard. JSON

---
# <mark style="background: #FFB86CA6;">Practice Exercises</mark>
<mark style="background: #FFF3A3A6;">1. This chapter has described several major advantages of a database system. What are two disadvantages?</mark>
Two disadvantages associated with database systems are listed below.
- Setup of the database system requires more knowledge, money, skills, and time.
- The complexity of the database may result in poor performance.

<mark style="background: #FFF3A3A6;">2. List five ways in which the type declaration system of a language such as Java or C++ differs from the data definition language used in a database.</mark>
a. Executing an action in the DDL results in the creation of an object in the database; in contrast, a programming language type declaration is simply an abstraction used in the program.

b. Database DDLs allow consistency constraints to be specified, which programming language type systems generally do not allow. These include domain constraints and referential integrity constraints.

c. Database DDLs support authorization, giving different access rights to different users. Programming language type systems do not provide such protection (at best, they protect attributes in a class from being accessed by methods in another class).

d. Programming language type systems are usually much richer than the SQL type system. Most databases support only basic types such as different types of numbers and strings, although some databases do support some complex types such as arrays and objects.

e. A database DDL is focused on specifying types of attributes of relations; in contrast, a programming language allows objects and collections of objects to be created.

<mark style="background: #FFF3A3A6;">3. List six major steps that you would take in setting up a database for a particular enterprise</mark>
Six major steps in setting up a database for a particular enterprise are:
- Define the high-level requirements of the enterprise (this step generates a document known as the system requirements specification).
- Define a model containing all appropriate types of data and data relationships.
- Define the integrity constraints on the data.
- Define the physical level.
- For each known problem to be solved on a regular basis (e.g., tasks to be carried out by clerks or web users), define a user interface to carry out the task, and write the necessary application programs to implement the user interface.
- Create/initalize the database.

<mark style="background: #FFF3A3A6;">1.7  List four significant differences between a file-processing system and a DBMS</mark>
- A file-processing system is more specific to the problem at hand while a DBMS is more general. A file-processing system used by a university is difficult to use in a hospital setting. While a DBMS once written can be used in different places.

- It is difficult to ensure atomicity in a conventional file-processing system while it is a lot easier in a DBMS. Often wrapping a set of SQL statements in a "BEGIN TRANSACTION" and "END TRANSACTION" are often enough in the relational DBMS world.

- Protecting against concurrent-access anomalies in a file-processing system is difficult. Using a DBMS is much easier to protect against concurrent-access anomalies.

- Most DBMS have a concept of a user and what access that user has. Enforcing such authorization in a file-processing system is really difficult.

<mark style="background: #FFF3A3A6;">1.8 Explain the concept of physical data independence and its importance in database systems.</mark>
There are 3 levels of data abstraction in a database: Physical Level, Logical Level and View Level. Physical data independence is the abstraction provided by the Logical Level to hide the complex data-structures that are used at the Physical Level to retrieve data efficiently.

<mark style="background: #FFF3A3A6;">1.14. Explain why NoSQL systems emerged in the 2000s, and briefly contrast their features with traditional database systems</mark>
Why did NoSQL systems emerged in the 2000s?
→ The variety of new data-intensive applications and the need for rapid development led to NoSQL systems.
Contrast NoSQL systems with traditional database systems
→ Traditional database systems support strict data consistency while, NoSQL systems support "eventual consistency" which allowed for distributed copies of data to be inconsistent as long as they would eventually converge in the absence of further updates.

---
# <mark style="background: #BBFABBA6;">2.3 Keys</mark>
**Candidate keys**: minimal superkeys.
**referential integrity constraint** : requires that the values appearing in specified attributes of any tuple in the referencing relation also appear in specified attributes of at least one tuple in the referenced relation.

---
# <mark style="background: #ADCCFFA6;">2.6 The Relational Algebra</mark>
The relational algebra consists of a set of operations that take one or two relations as input and produce a new relation as their result.
## 2.6.1 The Select operation
The **select** operation selects tuples that satisfy a given predicate. 
$$\sigma_{dept\_name} = Physics(TableName)$$
## 2.6.2 The Projection Operation
Suppose we want to list all instructors’ ID, name, and salary, but we do not care about the dept name. The project operation allows us to produce this relation.
$$\Pi_{ID, name, salary}(instructor)$$
## 2.6.4 The Cartesian-Product Operation
Combine all like $m*n \text{, }\times$. 

## 2.6.5 The Join Opertion
Sub of Cartesian but has condition to mapping.
![[Pasted image 20230626001509.png]]
![[Pasted image 20230626001537.png]]

## 2.6.6 Set Operations
![[Pasted image 20230626001805.png]]
![[Pasted image 20230626001821.png]]
![[Pasted image 20230626001859.png]]
![[Pasted image 20230626001909.png]]
## 2.6.7 The Assignment Operation
The assignment operation, denoted by ←

## 2.6.8 The Rename Operation
![[Pasted image 20230626002012.png]]
Find the ID and name of those instructors who earn more than the instructor whose ID is 12121
![[Pasted image 20230626002145.png]]

---

# <mark style="background: #D2B3FFA6;">Practice Exercies</mark>
2.10 <mark style="background: #CACFD9A6;">Describe the differences in meaning between the terms relation and relation schema.</mark>
- relation is a set of tuples.
- relation schema is used to refer to the the structure of a relation. A relation schema consists of a list of attributes and their corresponding domains.

---
# <mark style="background: #FFB8EBA6;">3.1 Overview of the SQL Query Language</mark>
	