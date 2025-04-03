CREATE TABLE Professor (cpf int,
					   idade int,
					   salario real,
					   nome varchar(40),
					   CONSTRAINT pk_Professor PRIMARY KEY (cpf));
					   
INSERT INTO PROFESSOR VALUES (1, 20, 2000, ' Gustavo Sanches'),
							 (2, 30, 3000, 'Júlio Leite'),
							 (3, 31, 3000, 'Júlia Bispo'),
							 (4, 26, 3500, 'Anna Júlia');
							 
							
							 
CREATE TABLE DISCIPLINA (codigo int,
						cpf int,
						nome varchar(40),
						sala varchar(40),
						CONSTRAINT pk_DISCIPLINA PRIMARY KEY (codigo),
						CONSTRAINT fk_PROFESSOR_DISCIPLINA FOREIGN KEY (cpf) REFERENCES PROFESSOR (cpf));	
						
INSERT INTO DISCIPLINA VALUES 	(10, 1, 'Matemática', 'D06'),
								(20, 2, 'Inglês', 'D04'),
								(30, 3, 'Biologia', 'D06'),
								(40, 4, 'Artes', 'D05'),
								(50, 1, 'Informática', 'D03');
								
CREATE TABLE ALUNO (Matricula int,
				    nome varchar(40),
				    idade int,
				    CONSTRAINT pk_ALUNO PRIMARY KEY (Matricula));
					
INSERT INTO ALUNO VALUES (100, 'Maria da Silva', 14),
(200, 'Flávia Antunes', 14),
(300, 'Pedro Silva', 11),
(400, 'Mariana', 18),
(500, 'Camila', 17),
(600, 'Amanda', 12),
(700, 'Mário', 13),
(800, 'Valdecir', 21),
(900, 'Milena', 10),
(1000, 'Nélson', 16),
(1100, 'Josemar', 23),
(1200, 'Heloísa', 17),
(1300, 'Eduarda', 14),
(1400, 'Cândida', 15),
(1500, 'Fabrício', 15);

CREATE TABLE ESTUDA (id_estuda int,
					 codigo int,
					 matricula int,
					CONSTRAINT pk_ESTUDA PRIMARY KEY (id_estuda),
					CONSTRAINT fk_DISCIPLINA_ESTUDA FOREIGN KEY (codigo) REFERENCES DISCIPLINA(codigo),
					CONSTRAINT fk_ALUNO_ESTUDA FOREIGN KEY (matricula) REFERENCES ALUNO (matricula));
					
INSERT INTO ESTUDA VALUES(1000, 10, 100),
(2000, 10, 200),
(3000, 10, 300),
(4000, 20, 400),
(5000, 20, 500),
(6000, 20, 600),
(7000, 30, 700),
(8000, 30, 800),
(9000, 30, 900),
(10000, 40, 1000),
(11000, 40, 1100),
(12000, 40, 1200),
(13000, 50, 1300),
(14000, 50, 1400),
(15000, 50, 1500);

--a)Quem é o professor que leciona na disciplina de Matemática?

SELECT PROFESSOR.nome, DISCIPLINA.nome
	FROM PROFESSOR INNER JOIN DISCIPLINA
	ON PROFESSOR.cpf = DISCIPLINA.cpf
	WHERE DISCIPLINA.nome = 'Matemática';
	
--b) Quem é o aluno que se chama Maria da Silva?

SELECT * FROM ALUNO
	WHERE nome = 'Maria da Silva';
	
--c) Qual é a disciplina lecionada pelo professor Júlio Leite?

SELECT PROFESSOR.nome, DISCIPLINA.nome
	FROM PROFESSOR INNER JOIN DISCIPLINA
	ON PROFESSOR.cpf = DISCIPLINA.cpf
	WHERE PROFESSOR.nome = 'Júlio Leite';
	
--d) Quais são os alunos matriculados na disciplina de Inglês?

SELECT ALUNO.nome, DISCIPLINA.nome
	   FROM ALUNO INNER JOIN ESTUDA
	   ON ALUNO.matricula = ESTUDA.matricula
	   INNER JOIN DISCIPLINA
	   ON DISCIPLINA.codigo = ESTUDA.codigo
	   WHERE DISCIPLINA.nome = 'Inglês';

--e) O professor Gustavo Sanches dá aula para a Flávia Antunes?

SELECT ALUNO.nome, PROFESSOR.nome
	FROM ALUNO INNER JOIN ESTUDA
	ON ALUNO.matricula = ESTUDA.matricula
	INNER JOIN DISCIPLINA 
	ON DISCIPLINA.codigo = ESTUDA.codigo
	INNER JOIN PROFESSOR
	ON PROFESSOR.cpf = DISCIPLINA.cpf
	WHERE PROFESSOR.nome = ' Gustavo Sanches' AND ALUNO.nome = 'Flávia Antunes';

--f) Qual o nome dos professores que lecionam na sala D06?

SELECT PROFESSOR.nome, DISCIPLINA.sala
	FROM PROFESSOR INNER JOIN DISCIPLINA
	ON PROFESSOR.cpf = DISCIPLINA.cpf
	WHERE DISCIPLINA.sala = 'D06';
	
--g) Quantos professores têm o nome Gustavo?

SELECT COUNT(nome) AS "Professores com o nome Gustavo" FROM PROFESSOR WHERE nome like '%Gustavo%';

--h) Quantos alunos têm o sobrenome “Silva”?

SELECT COUNT(nome) AS "Alunos com o sobrenome Silva" FROM ALUNO WHERE nome like '%Silva%';

--i) Qual o maior salário dos professores

SELECT MAX(salario) as "Maior salário dos professores:" FROM PROFESSOR;

--j) Qual a média de idade dos alunos da disciplina de biologia?

SELECT AVG(ALUNO.idade) AS "Média de idade dos alunos da disciplina de biologia:" 
FROM ALUNO INNER JOIN ESTUDA
ON ALUNO.matricula = ESTUDA.matricula
INNER JOIN DISCIPLINA
ON DISCIPLINA.codigo = ESTUDA.codigo
WHERE DISCIPLINA.nome = 'Biologia';

--k) Qual a média salarial dos professores?

SELECT AVG(salario) AS "Média salarial dos professores:" FROM PROFESSOR;

--l) Qual aluno tem a menor idade?

SELECT MIN(idade) AS "Menor idade dos alunos:" FROM ALUNO;