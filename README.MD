# Projeto de banco de dados


## Description

Final project developed by **Catarina Lenice** e **Rafael Duarte** for the course "Banco de Dados I(Databases I)" at IFPB and presented in **August 2018**. It consisted in designing a relational database with the following specifications:

1. Introduction
2. Conceptual data model
    
    ER diagram using Peter Chen's notation using brModelo. This data model should contain at least one of the following:

    *   a
    *   a
    *   a
    *   a
    *   

3. Logical data model
4. Data dictionary
5. SQL script using Microsoft SQL server according to the following specifications:
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
    4. a
    5. 

## Files

* **scriptCriaçãoUniversidade.sql** 

    Creates the database, tables and inserts data on them.

* **consultas_modificações_exclusões.sql** 

    Has a few queries, updates and deletions.

* **Projeto_BD.pdf** 
  
    Contains (in portuguese) the mini-world description, the conceptual and logical data models, and the data dictionary. 

## Mini-world description

O banco de dados desenvolvido tem como finalidade representar e armazenar as informações dos docentes, discentes, locais e atividades desenvolvidas em uma universidade.

Nela, alunos são matriculados em cursos e inscrevem-se em disciplinas, que podem ter outras disciplinas como pré-requisitos e são ministradas por um ou mais professores. Os professores podem ainda estar envolvidos em projetos de pesquisa que devem possuir pelo menos um discente, podendo este ser bolsista ou voluntário.

Um aluno pode pedir dispensa da disciplina, desde que com o aval do professor resposável pela mesma. As  aulas são  realizadas  em  salas  de  aula,  laboratórios  ou  auditórios. E ao serem  realizadas, os professores  que  às  ministram  podem  usar  ou  não  usar  algum  recurso  como  um  equipamento  ou  um software.

Cada curso tem um professor que o coordena e um professor pode coordenar apenas um curso.

São mantidas informações dos alunos como nome, CPF, endereço (rua, número, bairro), um ou mais números de telefone e matrícula.  Dos professores armazena-se:  Nome, CPF, matrícula, endereco (rua, número,  bairro), um  ou  mais  números de telefone, titulação. Das disciplinas: Horário, carga horária, limite de alunos, obrigatoriedade. Dos locais mantêm-se um código de identificação. As salas de têm um número definido de carteiras, os laboratórios de bancadas de experimentos e os auditórios de capacidade e microfones, podendo estes últimos terem datashow.

Além disso, mantêm-se informações dos dependentes dos professores, como nome, data de nascimento e CPF para a associação dos docentes da universidade.

## Conceptual data model

Created using *brModelo*:

![Conceptual data model](/media/conceitual.png)

## Logical data model

Created using *MySQL Workbench*:

![Logical data model](/media/logico.png)