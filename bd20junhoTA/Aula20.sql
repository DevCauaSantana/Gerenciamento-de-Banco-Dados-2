--TABELA ALUNO

CREATE TABLE ALUNOS (Nome  VARCHAR(20),
					 Matricula INT,
					 Rua VARCHAR(20),
					 Bairro VARCHAR(20),
					 Cidade VARCHAR(20),
					 CEP INT,
					 Fone INT,					 
					 CONSTRAINT Pk_ALUNOS PRIMARY KEY (Matricula) 
					 );
					 
					 
SELECT * FROM ALUNOS;

INSERT INTO ALUNOS VALUES ('Anna Júlia',111,'Paraná','Jardim Brasil 2','Riolândia',1111,40028922),
('Cauã',222,'Pará','Pinheiros','Votuporanga',2222,20031233),
('Caio',333,'Isbela','Primavera','Araçatuba',3333,20041233),
('Maria',444,'Americano','Pinheiros','Votuporanga',4444,20051233),
('Angel',555,'Dallas','Outono','Fernandopólis',5555,20061233),
 ('Alice',666,'Hatcher','Interestelar','Cosmorama',6666,20071233),
 ('Guilherme',777,'Carrosel','Chiquititas','Cubatão',7777,20081233),
 ('Anya',888,'Butantan','São Paulo','Floreal',8888,20091233),
('Fernando',999,'Santa Catarina','Alegria','Cosmorama',9999,20021233),
('Gabriela',000,'Paschoal','Jardim Brasil 3','Riolândia',0000,20011233);

--TABELA ALUNOS DA BANDA

CREATE TABLE ALUNOS_DA_BANDA(cod_Matricula int,
							 Instrumento varchar(20),
							 Data_de_Ingresso date,
							 Matricula int,
							 cod_Instrumento int,
							 CONSTRAINT pk_ALUNOS_DA_BANDA PRIMARY KEY(cod_Matricula),
							 CONSTRAINT fk_ALUNOS_ALUNOS_DA_BANDA FOREIGN KEY(Matricula) REFERENCES  ALUNOS (Matricula),
							 CONSTRAINT fk_INSTRUMENTOS_ALUNOS_DA_BANDA FOREIGN KEY(cod_InStrumento) REFERENCES INSTRUMENTOS (cod_Instrumento)
							);
							
				
INSERT INTO ALUNOS_DA_BANDA VALUES (11, 'Piano', '25-05-2012', 111,1),
(22, 'Piano', '26-09-2012', 222,1),
(33, 'Violino', '27-09-2012', 333,2),
(44, 'Violão', '28-06-2013', 444,3),
(55, 'Bateria', '29-07-2012', 555,5),
(66, 'Guitarra', '26-09-2014', 666,4),
(77, 'Guitarra', '02-12-2013', 777,4),
(88, 'Violão', '05-08-2012', 888,3),
(99, 'Violino', '24-09-2015', 999,2);

SELECT * FROM ALUNOS_DA_BANDA;

--TABELA INSTRUMENTOS
CREATE TABLE INSTRUMENTOS(cod_Instrumento int,
						 Nome_Instrumento varchar (40),
						 CONSTRAINT pk_INSTRUMENTOS PRIMARY KEY(cod_Instrumento)
						 );
						 	 
						 
INSERT INTO INSTRUMENTOS VALUES(1, 'Piano'),
(2, 'Violino'),
(3, 'Violão'),
(4, 'Guitarra'),
(5, 'Bateria');

SELECT * FROM INSTRUMENTOS;

-- Qual o nome do aluno que mora no Bairro Chiquititas? (Utilizando apenas 1 tabela)

SELECT nome, Bairro FROM ALUNOS 
 WHERE Bairro = 'Chiquititas';

-- Qual aluno que participa da banda e toca Violino? (Utilizando 2 tabelas)

SELECT ALUNOS.nome , ALUNOS_DA_BANDA.instrumento
   FROM ALUNOS INNER JOIN ALUNOS_DA_BANDA
     ON ALUNOS.Matricula = ALUNOS_DA_BANDA.Matricula
	   WHERE ALUNOS_DA_BANDA.instrumento = 'Violino';
   
-- Qual é a data de ingressão dos alunos que tocam piano? (Utilizando 3 tabelas)

SELECT ALUNOS.nome , ALUNOS_DA_BANDA.data_de_ingresso, INSTRUMENTOS.instrumento 
   FROM ALUNOS INNER JOIN ALUNOS_DA_BANDA
     ON ALUNOS.Matricula = ALUNOS_DA_BANDA.Matricula
	 INNER JOIN INSTRUMENTOS
	 ON ALUNOS_DA_BANDA.cod_Instrumento = INSTRUMENTOS.cod_Instrumento
	   WHERE ALUNOS_DA_BANDA.instrumento = 'Piano';
	   
-- Qual aluno que participa da banda e toca Piano? (Utilizando 3 tabelas)
	   
