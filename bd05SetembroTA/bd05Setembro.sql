--TABELA TURMA
CREATE TABLE TURMA (codTurma int,
					descriTurma varchar(40),
					CONSTRAINT pk_Turma PRIMARY KEY (codTurma)
);

INSERT INTO TURMA VALUES(11, 'Informática'),
						 (12, 'Edificações');
						 
SELECT * FROM TURMA;						 

--TABELA DISCIPLINA
CREATE TABLE DISCIPLINA (codDisc int,
						nomeDisc varchar(40),
						CONSTRAINT pk_Disciplina PRIMARY KEY (codDisc)
);

INSERT INTO DISCIPLINA VALUES(21, 'Matemática'),
						 	  (22, 'Artes');
							  
SELECT * FROM DISCIPLINA;

--TABELA CIDADE
CREATE TABLE CIDADE (codCidade int,
					 nomeCidade varchar(40),
					 CONSTRAINT pk_Cidade PRIMARY KEY (codCidade)
);

INSERT INTO CIDADE VALUES(31, 'Votuporanga'),
						  (32, 'São Paulo');
						  
SELECT * FROM CIDADE;

--TABELA ALUNO
CREATE TABLE ALUNO (codAluno int,
					nomeAlu varchar(40),
					codCidade int,
					CONSTRAINT pk_Aluno PRIMARY KEY (codAluno),
					CONSTRAINT fk_Cidade_Aluno FOREIGN KEY (codCidade) REFERENCES CIDADE (codCidade)
);

INSERT INTO ALUNO VALUES  (41, 'Cauã', 32),
						  (42, 'Vitória', 31);
						  
SELECT * FROM ALUNO;

--TABELA TURMA_ALUNO_DISCIPLINA
CREATE TABLE TURMA_ALUNO_DISCIPLINA (codTurma int,
									codAluno int,
									codDisc int,
									CONSTRAINT fk_Turma_Turma_Aluno_Disciplina FOREIGN KEY (codTurma) REFERENCES TURMA (codTurma),
									CONSTRAINT fk_Aluno_Turma_Aluno_Disciplina FOREIGN KEY (codAluno) REFERENCES ALUNO (codAluno),
									CONSTRAINT fk_Disciplina_Turma_Aluno_Disciplina FOREIGN KEY (codDisc) REFERENCES DISCIPLINA (codDisc)
);

INSERT INTO TURMA_ALUNO_DISCIPLINA VALUES  (11, 41, 21),
						  				   (12, 42, 22);	

SELECT * FROM TURMA_ALUNO_DISCIPLINA;						 
							  						  						 					  						  						