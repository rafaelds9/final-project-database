/*** Criação do banco de dados ***/
CREATE DATABASE bd_Universidade
GO
USE bd_Universidade
GO


/*** Criação da tabela Aluno ***/ 
CREATE TABLE Aluno 
(
  matriculaaluno varchar(11)       NOT NULL,
  nomealuno   varchar(45)      NOT NULL,
  cpfaluno varchar(11)       NOT NULL,
  ruaendereçoaluno   varchar(45)      NULL,
  numendereçoaluno int       NULL,
  cidadeendereçoaluno   varchar(45)      NULL,

  emailaluno varchar(40)       NOT NULL,
  CONSTRAINT PK_aluno      PRIMARY KEY (matriculaaluno),
  CONSTRAINT CK_aluno_matriculaaluno CHECK (LEN(matriculaaluno) = 11 AND matriculaaluno LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
  CONSTRAINT AK_aluno_cpfaluno UNIQUE (cpfaluno),
  CONSTRAINT CK_aluno_cpfaluno CHECK (LEN(cpfaluno) = 11 AND cpfaluno LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
  CONSTRAINT CK_aluno_emailaluno CHECK (emailaluno LIKE '%@%.%' AND emailaluno NOT LIKE '%@%@%'),
  CONSTRAINT CK_aluno_ruaendereçoaluno CHECK (LEN(ruaendereçoaluno) <= 45),
  CONSTRAINT CK_aluno_nomealuno CHECK (LEN(nomealuno) <= 45),
  CONSTRAINT CK_aluno_cidadeendereçoaluno CHECK (LEN(cidadeendereçoaluno) <= 45)

)

/***Criação da Tabela TelefoneAluno ***/
CREATE TABLE TelefoneAluno
(
 matriculaaluno varchar(11) NOT NULL,
 telefone varchar(15)  NOT NULL,
 CONSTRAINT FK_telefonealuno_matriculaaluno FOREIGN KEY(matriculaaluno) REFERENCES Aluno,
 CONSTRAINT PK_telefonealuno PRIMARY KEY (matriculaaluno, telefone),
 CONSTRAINT CK_telefonealuno_telefone CHECK (LEN(telefone) > 13 AND (telefone LIKE '+[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]' OR telefone LIKE '+[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'))

)

/*** Criação da tabela Professor ***/ 
CREATE TABLE Professor 
(
  matriculaprofessor varchar(11)       NOT NULL,
  nomeprofessor   varchar(45)      NOT NULL,
  cpfprofessor varchar(11)       NOT NULL,
  ruaendereçoprofessor   varchar(45)      NULL,
  numendereçoprofessor int       NULL,
  cidadeendereçoprofessor   varchar(45)      NULL,

  titulacao varchar(20)       NOT NULL,
  CONSTRAINT PK_professor      PRIMARY KEY (matriculaprofessor),
  CONSTRAINT CK_professor_matriculaprofessor CHECK (LEN(matriculaprofessor) = 11 AND matriculaprofessor LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
  CONSTRAINT AK_professor_cpfprofessor UNIQUE (cpfprofessor),
  CONSTRAINT CK_professor_cpfprofessor CHECK (LEN(cpfprofessor) = 11 AND cpfprofessor LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
  CONSTRAINT CK_professor_ruaendereçoprofessor CHECK (LEN(ruaendereçoprofessor) <= 45),
  CONSTRAINT CK_professor_nomeprofessor CHECK (LEN(nomeprofessor) <= 45),
  CONSTRAINT CK_professor_cidadeendereçoprofessor CHECK (LEN(cidadeendereçoprofessor) <= 45),
  CONSTRAINT CK_professor_titulacao CHECK (LEN(titulacao) <= 20)
)

/***Criação da Tabela TelefoneProfessor***/
CREATE TABLE TelefoneProfessor
(
 matriculaprofessor varchar(11) NOT NULL,
 telefone varchar(15) NOT NULL,
 CONSTRAINT FK_telefoneprofessor_matriculaprofessor FOREIGN KEY(matriculaprofessor) REFERENCES Professor,
 CONSTRAINT PK_telefoneprofessor PRIMARY KEY (matriculaprofessor, telefone),
 CONSTRAINT CK_telefoneprofessor_telefone CHECK (LEN(telefone) > 13 AND (telefone LIKE '+[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]' OR telefone LIKE '+[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'))
)

/*** Criação da tabela Dependente ***/ 
CREATE TABLE Dependente
(
  numdependente varchar(2)         NOT NULL,
  nomedependente      varchar(45)        NOT NULL,
  cpfdependente      varchar(11)         NOT NULL,
  datanascimento   date       NOT NULL,
  matriculaprofessor     varchar(11)       NOT NULL,
  CONSTRAINT FK_dependente_matriculaprofessor FOREIGN KEY (matriculaprofessor) REFERENCES Professor,
  CONSTRAINT PK_dependente        PRIMARY KEY (numdependente, matriculaprofessor),
  CONSTRAINT CK_dependente_numdependente CHECK (LEN(numdependente) = 2 AND numdependente LIKE '[0-9][0-9]'),
  CONSTRAINT AK_dependente_cpfdependente UNIQUE (cpfdependente),
  CONSTRAINT CK_dependente_cpfdependente CHECK (LEN(cpfdependente) = 11 AND cpfdependente LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
  CONSTRAINT CK_dependente_nomedependente CHECK (LEN(nomedependente) <= 45),
  CONSTRAINT CK_dependente_matriculaprofessor CHECK (LEN(matriculaprofessor) = 11)
)


/*** Criação da tabela Curso ***/ 
CREATE TABLE Curso 
(
  idcurso int             NOT NULL,
  nomecurso     varchar(45)          NOT NULL,
  duracaocurso varchar(45)           NOT NULL,
  qtdedisciplinas int           NOT NULL,
  matriculaprofessor varchar(11)           NOT NULL,
  iniciocoordenacao     date  NOT NULL,
  CONSTRAINT PK_curso          PRIMARY KEY (idcurso), 
  CONSTRAINT FK_curso_matriculaprofessor FOREIGN KEY (matriculaprofessor) REFERENCES Professor,
  CONSTRAINT AK_curso_matriculaprofessor UNIQUE (matriculaprofessor),
  CONSTRAINT CK_curso_matriculaprofessor CHECK (LEN(matriculaprofessor) = 11),
  CONSTRAINT CK_curso_nomecurso CHECK (LEN(nomecurso) <= 45),
  CONSTRAINT CK_curso_duracaocurso CHECK (LEN(duracaocurso) <= 45)
)


/*** Criação da tabela Disciplina ***/
CREATE TABLE Disciplina 
(
  iddisciplina    int           NOT NULL,
  nomedisciplina       varchar(45)          NOT NULL,
  obrigatoriedade      tinyint                 NOT NULL,
  cargahoraria     int           NULL,
  nummaxalunos	int		NULL,
  CONSTRAINT PK_disciplina             PRIMARY KEY (iddisciplina), 
  CONSTRAINT CK_disciplina_cargahoraria        CHECK (cargahoraria >= 0),
  CONSTRAINT CK_disciplina_nummaxalunos       CHECK (nummaxalunos > 0),
  CONSTRAINT CK_disciplina_nomedisciplina       CHECK (LEN(nomedisciplina) <= 45)
)


/*** Criação da tabela Aula ***/ 
CREATE TABLE Aula
(
  numaula    int              NOT NULL,
  duracao    time             NULL,
  conteudo   varchar(45)      NULL,
  CONSTRAINT PK_aula      PRIMARY KEY (numaula),
  CONSTRAINT CK_aula_numaula CHECK (numaula >= 0),
  CONSTRAINT CK_aula_conteudo       CHECK (LEN(conteudo) <= 45)
)

/*** Criação da tabela Recurso ***/ 
CREATE TABLE Recurso 
(
  idrecurso     int             NOT NULL,
  nomerecurso          varchar(45)          NOT NULL,
  qtdutilizada          int           NULL,
  versao      varchar(45)           NULL,
  codlicenca            varchar(45)          NULL,
  codpatrimonio         varchar(45)          NULL,
  matriculaprofessor          varchar(11)           NOT NULL,
  numaula      int                 NOT NULL,
  CONSTRAINT PK_recurso          PRIMARY KEY (idrecurso, matriculaprofessor, numaula),
  CONSTRAINT FK_recurso_matriculaprofessor  FOREIGN KEY (matriculaprofessor) REFERENCES Professor,
  CONSTRAINT FK_recurso_numaula  FOREIGN KEY (numaula) REFERENCES Aula,
  CONSTRAINT CK_recurso_nomecurso CHECK (LEN(nomerecurso) <= 45),
  CONSTRAINT CK_recurso_versao CHECK (LEN(versao) <= 45),
  CONSTRAINT CK_recurso_codlicenca CHECK (LEN(codlicenca) <= 45),
  CONSTRAINT CK_recurso_codpatrimonio CHECK (LEN(codpatrimonio) <= 45),
  CONSTRAINT CK_recurso_matriculaprofessor CHECK (LEN(matriculaprofessor) = 11)
)

/*** Criação da tabela Local ***/ 
CREATE TABLE Local
(
  codlocal   int         NOT NULL,
  CONSTRAINT PK_oLocal    PRIMARY KEY (codlocal),
)


/*** Criação da tabela SalaDeAula ***/ 
CREATE TABLE SalaDeAula 
(
  codlocal   int         NOT NULL,
  qtdecarteiras int      NULL,
  CONSTRAINT PK_saladeaula      PRIMARY KEY (codlocal),
  CONSTRAINT FK_saladeaula_codlocal      FOREIGN KEY (codlocal) REFERENCES Local,
  CONSTRAINT CK_saladeaula_qtdecarteiras  CHECK (qtdecarteiras >= 0)
)

/*** Criação da tabela Laboratorio ***/ 
CREATE TABLE Laboratorio 
(
  codlocal   int         NOT NULL,
  qtdebancadasexp int      NULL,
  CONSTRAINT PK_laboratorio      PRIMARY KEY (codlocal),
  CONSTRAINT FK_laboratorio_codlocal      FOREIGN KEY (codlocal) REFERENCES Local,
  CONSTRAINT CK_laboratorio_qtdebancadasexp CHECK (qtdebancadasexp >= 0)
)

/*** Criação da tabela Auditorio ***/ 
CREATE TABLE Auditorio 
(
  codlocal         int           NOT NULL,
  datashow         tinyint       NOT NULL,
  qtdemicrofones   int           NOT NULL,
  capacidade       int           NOT NULL,
  CONSTRAINT PK_auditorio      PRIMARY KEY (codlocal),
  CONSTRAINT FK_auditorio_codlocal      FOREIGN KEY (codlocal) REFERENCES Local,
  CONSTRAINT CK_auditorio_qtdemicrofones CHECK (qtdemicrofones >= 0),
  CONSTRAINT CK_auditorio_capacidade CHECK (capacidade >= 0)
)

/*** Criação da tabela ProjPesquisa ***/
CREATE TABLE ProjPesquisa 
(
  codprojeto    varchar(11)          NOT NULL,
  nomeprojeto   varchar(45)          NOT NULL,
  descricao     varchar(100)        NOT NULL,
  datainicio    date          NOT NULL,
  bolsa         tinyint      NOT NULL,
  CONSTRAINT PK_projeto	PRIMARY KEY (codprojeto),
  CONSTRAINT CK_projpesquisa_codprojeto CHECK (LEN(codprojeto) <= 11),
  CONSTRAINT CK_projpesquisa_nomeprojeto CHECK (LEN(nomeprojeto) <= 45),
  CONSTRAINT CK_projpesquisa_descricao CHECK (LEN(descricao) <= 100)
)

/*** Criação da tabela Cursa ***/ 
CREATE TABLE Cursa 
(
  matriculaaluno   varchar(11)           NOT NULL,
  iddisciplina     int                   NOT NULL,
  semestre         varchar(6)            NOT NULL,
  nota1       int           DEFAULT 0,
  nota2       int           DEFAULT 0,
  nota3       int           DEFAULT 0,
  CONSTRAINT FK_cursa_matriculaaluno  FOREIGN KEY (matriculaaluno) REFERENCES Aluno,
  CONSTRAINT FK_cursa_iddisciplina FOREIGN KEY (iddisciplina) REFERENCES Disciplina,
  CONSTRAINT PK_cursa PRIMARY KEY (matriculaaluno, iddisciplina,semestre),
  CONSTRAINT CK_cursa_semestre CHECK ((LEN(semestre) = 6) AND (semestre LIKE '%.[1-2]')),
  CONSTRAINT CK_nota1 CHECK (nota1 >= 0 and nota1 <=100),
  CONSTRAINT CK_nota2 CHECK (nota2 >= 0 and nota2 <=100),
  CONSTRAINT CK_nota3 CHECK (nota3 >= 0 and nota3 <=100)
)

/*** Criação da tabela Ocupa ***/ 
CREATE TABLE Ocupa 
(
  codlocal         int           NOT NULL,
  iddisciplina     int       NOT NULL,

  CONSTRAINT FK_ocupa_codlocal      FOREIGN KEY (codlocal) REFERENCES Local,
  CONSTRAINT FK_ocupa_iddisciplina FOREIGN KEY (iddisciplina) REFERENCES Disciplina,
  CONSTRAINT PK_ocupa PRIMARY KEY (codlocal, iddisciplina)
)



/*** Criação da tabela Dispensa ***/ 
CREATE TABLE Dispensa 
(
  matriculaaluno      varchar(11)       NOT NULL,
  matriculaprofessor  varchar(11)       NOT NULL,
  iddisciplina        int               NOT NULL,
  CONSTRAINT FK_dispensa_matriculaaluno      FOREIGN KEY (matriculaaluno) REFERENCES Aluno,
  CONSTRAINT FK_dispensa_matriculaprofessor FOREIGN KEY (matriculaprofessor) REFERENCES Professor,
  CONSTRAINT FK_dispensa_iddisciplina FOREIGN KEY (iddisciplina) REFERENCES Disciplina,
  CONSTRAINT PK_dispensa PRIMARY KEY (matriculaprofessor, iddisciplina, matriculaaluno),
  CONSTRAINT CK_dispensa_matriculaaluno CHECK (LEN(matriculaaluno) = 11),
  CONSTRAINT CK_dispensa_matriculaprofessor CHECK (LEN(matriculaprofessor) = 11)
)


/*** Criação da tabela Ministra ***/ 
CREATE TABLE Ministra 
(
  matriculaprofessor         varchar(11)           NOT NULL,
  numaula     int       NOT NULL,
  dataaula     date       NOT NULL,
  CONSTRAINT FK_ministra_matriculaprofessor      FOREIGN KEY (matriculaprofessor) REFERENCES Professor,
  CONSTRAINT FK_ministra_numaula FOREIGN KEY (numaula) REFERENCES Aula,
  CONSTRAINT PK_ministra PRIMARY KEY (matriculaprofessor, numaula),
  CONSTRAINT CK_ministra_matriculaprofessor CHECK (LEN(matriculaprofessor) = 11)
)

/*** Criação da tabela Desenvolvem ***/ 
CREATE TABLE Desenvolvem 
(
  matriculaaluno         varchar(11)           NOT NULL,
  matriculaprofessor     varchar(11)           NOT NULL,
  codprojeto             varchar(11)           NOT NULL,
  CONSTRAINT FK_desenvolvem_matriculaaluno      FOREIGN KEY (matriculaaluno) REFERENCES Aluno,
  CONSTRAINT FK_desenvolvem_matriculaprofessor      FOREIGN KEY (matriculaprofessor) REFERENCES Professor,
  CONSTRAINT FK_desenvolvem_codprojeto FOREIGN KEY (codprojeto) REFERENCES ProjPesquisa,
  CONSTRAINT PK_desenvolvem PRIMARY KEY (matriculaprofessor, matriculaaluno, codprojeto),
  CONSTRAINT CK_desenvolvem_matriculaaluno CHECK (LEN(matriculaaluno) = 11),
  CONSTRAINT CK_desenvolvem_matriculaprofessor CHECK (LEN(matriculaprofessor) = 11),
  CONSTRAINT CK_desenvolvem_codprojeto CHECK (LEN(codprojeto) <= 11)
)



/*** Criação da tabela Contem ***/ 
CREATE TABLE Contem 
(
  idcurso          int           NOT NULL,
  iddisciplina     int           NOT NULL,
  CONSTRAINT FK_contem_idcurso      FOREIGN KEY (idcurso) REFERENCES Curso,
  CONSTRAINT FK_contem_iddisciplina FOREIGN KEY (iddisciplina) REFERENCES Disciplina,
  CONSTRAINT PK_contem PRIMARY KEY (idcurso, iddisciplina),
)

/*** Criação da tabela PreRequisito ***/ 
CREATE TABLE PreRequisito
(
  prerequisito           int           NOT NULL,
  disciplinadesejada     int           NOT NULL,
  CONSTRAINT FK_prerequisito_prerequisito      FOREIGN KEY (prerequisito) REFERENCES Disciplina,
  CONSTRAINT FK_prerequisito_disciplinadesejada FOREIGN KEY (disciplinadesejada) REFERENCES Disciplina,
  CONSTRAINT PK_prerequisito PRIMARY KEY (prerequisito, disciplinadesejada),
)

SET DATEFORMAT 'DMY'

/*** Inserção de dados na tabela Aluno ***/
INSERT INTO Aluno VALUES ('20152610001','Laura Avelar', '45893468710', 'Horacio Trajano', 841, 'João Pessoa', 'lauravelar@gmail.com')
INSERT INTO Aluno VALUES ('20152610002','Cecilia Fonseca', '12193477820', 'Avenida Rui Carneiro', 310, 'João Pessoa', 'ceciliafonseca@gmail.com')
INSERT INTO Aluno VALUES ('20152610003','Carlos Almeida', '35976148560', 'Josefa Taveira', 283, 'João Pessoa', 'carlosalmeida@gmail.com')
INSERT INTO Aluno VALUES ('20152610004','Alberto Ferreira', '96486123348', 'Avenida Primeiro de Maio', 897, 'João Pessoa', 'albertoferreira@gmail.com')
INSERT INTO Aluno VALUES ('20152610005','Beatriz Nobrega', '54086495213', 'Avenida Guaraira', 654, 'João Pessoa', 'beatriznobrega@gmail.com')

/*** Inserção de dados na tabela TelefoneAluno ***/
INSERT INTO TelefoneAluno VALUES ('20152610001', '+55083996805941')
INSERT INTO TelefoneAluno VALUES ('20152610002', '+55083999885648')
INSERT INTO TelefoneAluno VALUES ('20152610003', '+55083999334688')
INSERT INTO TelefoneAluno VALUES ('20152610004', '+55083988869641')
INSERT INTO TelefoneAluno VALUES ('20152610005', '+55083988468797')
INSERT INTO TelefoneAluno VALUES ('20152610005', '+55083999554682')

/*** Inserção de dados na tabela Professor ***/
INSERT INTO Professor VALUES ('20101610100', 'Silvana Cunha', '56879463522', 'João Cabral de Lucena', 321, 'João Pessoa', 'Doutorado')
INSERT INTO Professor VALUES ('20101610200', 'Pedro Gonçalves', '76485297602', 'Av. Gov. Argemiro de Figueiredo', 51, 'João Pessoa', 'Doutorado')
INSERT INTO Professor VALUES ('20101610300', 'Evandro dos Santos', '44897588620', 'Av. Camilo de Holanda', 896, 'João Pessoa', 'Doutorado')
INSERT INTO Professor VALUES ('20101610400', 'Alberto Soares', '94862158797', 'Av. Hilton Souto Maior', 020, 'João Pessoa', 'Mestrado')
INSERT INTO Professor VALUES ('20101610500', 'Giovana Porto', '25168794350', 'Av. Manoel Deodato', 112, 'João Pessoa', 'Doutorado')

/*** Inserção de dados na tabela TelefoneProfessor ***/
INSERT INTO TelefoneProfessor VALUES ('20101610100', '+55083999687458')
INSERT INTO TelefoneProfessor VALUES ('20101610200', '+55083988796428')
INSERT INTO TelefoneProfessor VALUES ('20101610300', '+55083996778451')
INSERT INTO TelefoneProfessor VALUES ('20101610400', '+55083988976553')
INSERT INTO TelefoneProfessor VALUES ('20101610500', '+55083999339317')
INSERT INTO TelefoneProfessor VALUES ('20101610500', '+55083988869641')

/*** Inserção de dados na tabela Dependente ***/
INSERT INTO Dependente VALUES ('01', 'Claudia Soares', '78946532501', '03/10/1998', '20101610400')
INSERT INTO Dependente VALUES ('02', 'Alvaro Soares', '86479588420', '21/07/1995', '20101610400')
INSERT INTO Dependente VALUES ('03', 'Milena Cunha', '64895756210', '15/10/2000', '20101610100')
INSERT INTO Dependente VALUES ('04', 'Gabriela Porto', '89746527886', '15/12/1993', '20101610500')
INSERT INTO Dependente VALUES ('05', 'Valeria dos Santos', '56798436511', '05/11/1999', '20101610300')


/*** Inserção de dados na tabela Curso ***/
INSERT INTO Curso VALUES (1, 'Engenharia Elétrica', '5 anos', 56, '20101610100', '15/04/2017')
INSERT INTO Curso VALUES (2, 'Sistemas para Internet', '3 anos', 36, '20101610200','10/08/2012')
INSERT INTO Curso VALUES (3, 'Administração', '4 anos', 48, '20101610300', '21/12/2012')
INSERT INTO Curso VALUES (4, 'História', '4 anos', 48, '20101610400', '07/03/2011')
INSERT INTO Curso VALUES (5, 'Engenharia Mecanica', '5 anos', 56, '20101610500', '05/03/2014')

/*** Inserção de dados na tabela Disciplina ***/
INSERT INTO Disciplina VALUES (60, 'Calculo 1', 1, 100, 50)
INSERT INTO Disciplina VALUES (61, 'Algebra Vetorial', 1, 80, 40)
INSERT INTO Disciplina VALUES (62, 'Algebra Linear', 1, 100, 40)
INSERT INTO Disciplina VALUES (63, 'Calculo 2', 0, 80, 40)
INSERT INTO Disciplina VALUES (64, 'Projeto de Filtros e Amplificadores', 0, 80, 20)
INSERT INTO Disciplina VALUES (65, 'Banco de Dados', 0, 80, 40)

/*** Inserção de dados na tabela Aula ***/
INSERT INTO Aula VALUES (1, '01:40:00', 'Apresentação da Disciplina - Cálculo 1')
INSERT INTO Aula VALUES (2, '02:30:00', 'Revisão de Funções')
INSERT INTO Aula VALUES (3, NULL, NULL)
INSERT INTO Aula VALUES (4, '02:30:00', 'Limites em Funções de uma Variável')
INSERT INTO Aula VALUES (5, '01:40:00', 'Exercícios - Limites')
INSERT INTO Aula VALUES (6, '01:40:00', 'Apresentação da Disciplina - Álgebra Linear')
INSERT INTO Aula VALUES (7, '01:40:00', 'Apresentação da Disciplina -  Banco de Dados')
INSERT INTO Aula VALUES (8, '02:30:00', 'Apresentação da Disciplina - Algebra Vetorial')

/*** Inserção de dados na tabela Recurso ***/
INSERT INTO Recurso VALUES (1, 'Caixa de Som Portátil', 2, NULL, NULL, 'DEEZXC', '20101610100', 1)
INSERT INTO Recurso VALUES (2, 'Datashow', 1, NULL, NULL, 'DTI23490', '20101610200', 7)
INSERT INTO Recurso VALUES (3, 'MATLAB', NULL, 'R2014b', NULL, 'DEES879', '20101610300', 6)
INSERT INTO Recurso VALUES (4, 'GeogebraDeluxe', NULL, NULL, NULL, 'DMES230', '20101610400', 8)
INSERT INTO Recurso VALUES (5, 'GeogebraDeluxe', 1, NULL, NULL, 'DMES230', '20101610100', 2)

/*** Inserção de dados na tabela Local ***/
INSERT INTO Local VALUES (101)
INSERT INTO Local VALUES (102)
INSERT INTO Local VALUES (103)
INSERT INTO Local VALUES (104)
INSERT INTO Local VALUES (105)

INSERT INTO Local VALUES (201)
INSERT INTO Local VALUES (202)
INSERT INTO Local VALUES (203)
INSERT INTO Local VALUES (204)
INSERT INTO Local VALUES (205)

INSERT INTO Local VALUES (301)
INSERT INTO Local VALUES (302)
INSERT INTO Local VALUES (303)
INSERT INTO Local VALUES (304)
INSERT INTO Local VALUES (305)


/*** Inserção de dados na tabela SalaDeAula ***/
INSERT INTO SalaDeAula VALUES (101, 30)
INSERT INTO SalaDeAula VALUES (102, 25)
INSERT INTO SalaDeAula VALUES (103, 30)
INSERT INTO SalaDeAula VALUES (104, 40)
INSERT INTO SalaDeAula VALUES (105, 20)

/*** Inserção de dados na tabela Laboratorio ***/
INSERT INTO Laboratorio VALUES (201, 10)
INSERT INTO Laboratorio VALUES (202, 5)
INSERT INTO Laboratorio VALUES (203, 8)
INSERT INTO Laboratorio VALUES (204, 5)
INSERT INTO Laboratorio VALUES (205, 6)

/*** Inserção de dados na tabela Auditorio ***/
INSERT INTO Auditorio VALUES (301, 1, 2, 60)
INSERT INTO Auditorio VALUES (302, 1, 4, 100)
INSERT INTO Auditorio VALUES (303, 1, 2, 50)
INSERT INTO Auditorio VALUES (304, 1, 1, 65)
INSERT INTO Auditorio VALUES (305, 1, 4, 80)

/*** Inserção de dados na tabela ProjPesquisa ***/
INSERT INTO ProjPesquisa VALUES ('GPDS_111127', 'Espaço de Fases do Coração', 'Fazer a relação com o uso de machine learning do espaço de fases com cardiomiopatias', '15/05/2018', 1)
INSERT INTO ProjPesquisa VALUES ('GPDS_111128', 'Avaliação de Janelas em Filtros FIR', 'Avaliar a eficiência de diferentes janelas em filtros digitais de resposta finita', '07/03/2018', 0)
INSERT INTO ProjPesquisa VALUES ('GPDS_111129', 'Comunicações Moleculares', 'Estabelecer um modelo de comunicação por moleculas no corpo humano', '28/01/2018', 0)
INSERT INTO ProjPesquisa VALUES ('LINSCA_5789', 'Avaliação do Pré-Cálculo em Calouros', 'Comparar o desempenho de turmas de cálculo que tiveram curso pré cálculo com as que não o tiveram', '17/04/2017', 1)
INSERT INTO ProjPesquisa VALUES ('GREL_578690', 'Laboratório de robótica no IFPB', 'Avaliar o equipamento e espaço necessário para a implantação de um laboratório de robótica', '14/08/2016', 1)

/*** Inserção de dados na tabela Cursa ***/
INSERT INTO Cursa VALUES ('20152610001', 60, '2018.1', DEFAULT, DEFAULT, DEFAULT)
INSERT INTO Cursa VALUES ('20152610001', 61, '2018.1', 80, 70, DEFAULT)
INSERT INTO Cursa VALUES ('20152610004', 65, '2018.1', DEFAULT, DEFAULT, DEFAULT)
INSERT INTO Cursa VALUES ('20152610004', 60, '2017.2', 70, 80, 70)
INSERT INTO Cursa VALUES ('20152610003', 61, '2016.2', 100, 50, 70)

/*** Inserção de dados na tabela Ocupa ***/
INSERT INTO Ocupa VALUES(301, 60)
INSERT INTO Ocupa VALUES(201, 64)
INSERT INTO Ocupa VALUES(101, 61)
INSERT INTO Ocupa VALUES(102, 62)

/*** Inserção de dados na tabela Dispensa ***/
INSERT INTO Dispensa VALUES('20152610002', '20101610100', 60)
INSERT INTO Dispensa VALUES('20152610002', '20101610100', 61)
INSERT INTO Dispensa VALUES('20152610002', '20101610200', 63)
INSERT INTO Dispensa VALUES('20152610005', '20101610400', 60)
INSERT INTO Dispensa VALUES('20152610005', '20101610400', 61)


/*** Inserção de dados na tabela Ministra ***/
INSERT INTO Ministra VALUES('20101610100', 1, '12/03/2018')
INSERT INTO Ministra VALUES('20101610100', 2, '14/03/2018')
INSERT INTO Ministra VALUES('20101610100', 3, '19/03/2018')
INSERT INTO Ministra VALUES('20101610100', 4, '21/03/2018')
INSERT INTO Ministra VALUES('20101610200', 6, '14/03/2018')

/*** Inserção de dados na tabela Desenvolvem ***/
INSERT INTO Desenvolvem VALUES('20152610005', '20101610100', 'GPDS_111127')
INSERT INTO Desenvolvem VALUES('20152610001', '20101610100', 'GPDS_111128')
INSERT INTO Desenvolvem VALUES('20152610002', '20101610300', 'GPDS_111127')
INSERT INTO Desenvolvem VALUES('20152610003', '20101610200', 'LINSCA_5789')
INSERT INTO Desenvolvem VALUES('20152610004', '20101610500', 'GREL_578690')

/*** Inserção de dados na tabela Contem ***/
INSERT INTO Contem VALUES (1,60)
INSERT INTO Contem VALUES (2, 63)
INSERT INTO Contem VALUES (1, 64)
INSERT INTO Contem VALUES (2, 62)
INSERT INTO Contem VALUES (5, 61)


/*** Inserção de dados na tabela PreRequisito ***/
INSERT INTO PreRequisito VALUES (60, 62)
INSERT INTO PreRequisito VALUES (61, 62)
INSERT INTO PreRequisito VALUES (60, 63)
INSERT INTO PreRequisito VALUES (63, 64)
INSERT INTO PreRequisito VALUES (60, 65)
