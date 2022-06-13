/***
Exibir todas as colunas da tabela Aluno ordenadas de forma ascendente pelo nome do Aluno para alunos 
que tem C como primeira letra do nome OU que não moram em avenidas.
***/

SELECT * FROM Aluno
WHERE nomealuno LIKE 'C%' OR ruaendereçoaluno NOT LIKE 'Avenida%'
ORDER BY nomealuno

/***
Selecionar o nome dos alunos e os nomes das disciplinas mesmo que o aluno não curse qualquer disciplina
 e que uma disciplina não tenha qualquer aluno. Ordenar os resultados pelo nome do aluno e pelo nome da disciplina.
***/

SELECT nomealuno, nomedisciplina
FROM Aluno as al FULL JOIN Cursa as cu
ON al.matriculaaluno = cu.matriculaaluno
FULL JOIN Disciplina as di
ON cu.iddisciplina = di.iddisciplina

ORDER BY nomealuno, nomedisciplina

/***
Exibir o nome dos professores e os nomes de seus dependentes
***/

SELECT nomeprofessor, nomedependente
FROM Professor as prof INNER JOIN Dependente as dep
ON prof.matriculaprofessor = dep.matriculaprofessor


/***
Exibir o nome dos professores e sua quantidade de dependentes para professores com mais de um dependente.
***/
SELECT nomeprofessor, COUNT(*) as Qtde_Dep
FROM Professor as prof INNER JOIN Dependente as dep
ON prof.matriculaprofessor = dep.matriculaprofessor
GROUP BY nomeprofessor
HAVING COUNT(*) > 1

/***
Mostrar a menor, a maior e a média para a nota 1 na disciplina de Cálculo 1.
***/
SELECT MIN(nota1) as 'Menor Nota 1', MAX(nota1) as 'Maior nota 1', AVG(nota1) as Media
FROM CURSA
WHERE iddisciplina = (SELECT(iddisciplina)
					 FROM Disciplina
					 WHERE nomedisciplina = 'Calculo 1')


/***
Mostrar os nomes dos cursos cujos coordenadores assumiram em 2011 e 2012 e a data em que assumiram.
***/
SELECT nomecurso, iniciocoordenacao
FROM Curso
WHERE iniciocoordenacao BETWEEN '2011/01/01' AND '2012/12/31'

/***
Mostrar a soma do número de carteiras de todas as salas de aula, sem considerar na soma as carteiras 
das salas de código entre 101 e 103.
***/
SELECT SUM(qtdecarteiras) AS "Total de Carteiras" 
FROM SalaDeAula
WHERE codLocal NOT BETWEEN 101 and 103

/***
Mostrar numaula das aulas nas quais nenhuma informação acerca da duração e do conteúdo foi dada.
***/
SELECT *
FROM AULA
WHERE duracao IS NULL AND conteudo IS NULL

/***
Exibir o nome do aluno, nome do professor e o codprojeto. O nome de todos os alunos e de todos os 
professores deven ser exibidos, mesmo que não desenvolvam projeto.
***/
SELECT nomealuno, nomeprofessor, codprojeto
FROM Aluno AS al LEFT JOIN desenvolvem as de
ON al.matriculaaluno = de.matriculaaluno
RIGHT JOIN professor as pr
ON de.matriculaprofessor = pr.matriculaprofessor

/***
Exibir os dependentes de todos os professores que não tem endereço nas cidades Cabedelo e Conde.
***/
SELECT * FROM Dependente
WHERE matriculaprofessor IN(SELECT matriculaprofessor
							FROM Professor
							WHERE cidadeendereçoprofessor NOT IN ('Cabedelo', 'Conde'))

/***
Exibir as informações de todos os recursos cuja a quantidade utilizada está disponível, ou seja, 
não é nula.
***/
SELECT * FROM Recurso
WHERE qtdutilizada IS NOT NULL

/***
Alterar a nota3 da aluna Laura Avelar em Álgebra Vetorial para 60.
***/
UPDATE Cursa
SET nota3 = 60
WHERE iddisciplina = (SELECT iddisciplina FROM Disciplina
					  WHERE nomedisciplina = 'Algebra Vetorial') and matriculaaluno = (SELECT matriculaaluno FROM Aluno
																	   WHERE nomealuno = 'Laura Avelar')

/***
Atualizar a descrição para projeto encerrado e definir bolsa como 0 para projetos que iniciaram antes de 2018.
***/
UPDATE ProjPesquisa

SET descricao = 'Projeto Encerrado'
WHERE YEAR(datainicio) < 2018

UPDATE ProjPesquisa
SET bolsa = 0
WHERE YEAR(datainicio) < '2018'


/***
Remover todos os projetos de pesquisa que se iniciaram antes de 2018.
***/

SELECT * FROM ProjPesquisa

DELETE FROM Desenvolvem
WHERE codprojeto IN (SELECT codprojeto
					 FROM ProjPesquisa
					 WHERE YEAR(datainicio) < '2018') 

DELETE FROM ProjPesquisa
WHERE YEAR(datainicio) < '2018'

SELECT * FROM ProjPesquisa


/***
Excluir todas as salas de aula com menos de 30 carteiras.
***/

SELECT * FROM Local
SELECT * FROM Ocupa
SELECT * FROM SalaDeAula

DELETE FROM Ocupa
WHERE codlocal IN (SELECT codlocal
				   FROM SalaDeAula
				   WHERE qtdecarteiras < 30)

CREATE TABLE temp(
codlocal_para_excluir INT NOT NULL)

INSERT INTO temp(codlocal_para_excluir) 
SELECT codlocal 
FROM SalaDeAula 
WHERE qtdecarteiras < 30

DELETE FROM SalaDeAula
WHERE qtdecarteiras < 30

DELETE FROM Local
WHERE codlocal IN (SELECT *
				   FROM temp)

DROP TABLE temp

SELECT * FROM Local
SELECT * FROM Ocupa
SELECT * FROM SalaDeAula




