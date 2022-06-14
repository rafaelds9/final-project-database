# Relational Database Project


## Description

Final project developed by **Catarina Lenice** e **Rafael Duarte** for the course "Banco de Dados I(Databases I)" at IFPB and presented in **August 2018**. It consisted in designing a relational database with the following specifications:

1. **Introduction:**

    Description of how the database will be applied. It must contain the miniworld description which includes a detailed description of the business rules and the definition of the project scope.

2. **Conceptual data model:**
    
    ER diagram using Peter Chen's notation with the application *brModelo*. This data model should contain at least one of the following:

    *   One weak entity with identifying relationship
    *   One associative entity
    *   One specialization structure
    *   One N:N relationship
    *   One 1:1 relationship
    *   One relatioship with attributes
    *   One ternary relationship
    *   One self-relationship
    *   One multivalued attribute
    *   One composite attribute

3. **Logical data model:**

    Present the normalized relational diagram containing the maximal and minimal cardinalities for each relationship using crow's foot notation with *MySQL Workbench*.      

4. **Data dictionary**
5. **SQL script using Microsoft SQL server according to the following specifications:**
    1. Table creation using the following constraints:
        * Primary Key
        * Foreign Key
        * Unique
        * Check (at least 3)
        * Default 
    2.  Data insertion
         * Insert at least 5 rows in each table
    3. Conditional data update in at least two tables
         * Update in one column
         * Update in more than one column
    4. Conditional data removal in at least two tables
    5. Query data with a comment explaining what the query does and the answers. Where each query constains at least one of the following:
        * IN
        * NOT IN
        * BETWEEN
        * NOT BETWEEN
        * IS NULL
        * IS NOT NULL
        * LIKE
        * NOT LIKE
        * ORDER BY
        * COUNT
        * SUM
        * AVG
        * MAX
        * MIN
        * GROUP BY
        * HAVING
        * INNER JOIN
        * LEFT JOIN
        * RIGHT JOIN
        * FULL JOIN
        * SUBQUERY


## Files

* **descricao_projeto.pdf**

    Contains (in portuguese) the project specifications defined by the professors.

* **scriptCriaçãoUniversidade.sql** 

    Creates the database, tables and inserts data on them.

* **consultas_modificações_exclusões.sql** 

    Has a few queries, updates and deletions.

* **Projeto_BD.pdf** 
  
    Contains (in portuguese) the mini-world description, the conceptual and logical data models, and the data dictionary. 

## Mini-world description

The developed database aims to represent and store information from professors, students, places and activities developed at a university.

In it, students are enrolled in courses and enroll in disciplines, which may have other disciplines as prerequisites and are taught by one or more professors. Teachers can also be involved in research projects that must have at least one student, who can be a scholarship student or a volunteer.

A student may request a waiver from the discipline, provided that he/she has the approval of the teacher responsible for it. Classes are held in classrooms, laboratories or auditoriums. And when they are carried out, the teachers who teach them can use or not use some resource such as equipment or software.

Each course has a professor who coordinates it and a professor can coordinate only one course.

Student information such as name, CPF (brazilian Individual Taxpayer ID), address (street, number, neighborhood), one or more telephone numbers and registration number is kept. From the teachers' information are stored: Name, CPF, registration, address (street, number, neighborhood), one or more telephone numbers, title. From the disciplines are stored: Schedule, workload, student limit, mandatory. An identification code is kept for the locations. The rooms have a defined number of desks, the laboratories with benches for experiments and the auditoriums with capacity and microphones, the latter being able to have a projector.

In addition, information of the professors' dependents, such as name, date of birth and CPF, is maintained for the association of the university's professors.


## Conceptual data model (portuguese)

Created using *brModelo*. Open in a new tab to see the full image.

![Conceptual data model](/media/conceitual.png)

## Logical data model (portuguese)

Created using *MySQL Workbench*. Open in a new tab to see the full image.

![Logical data model](/media/logico.png)