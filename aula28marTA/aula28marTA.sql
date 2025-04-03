--O conceito de chave-primária é muito importante no contexto de banco de dados relacionais.
--A chave-primária permite identificar uma e somente uma linha em uma tabela.
--Além disso, a chave-primária ajuda a estabelecer os relacionamentos entre as tabelas

CREATE TABLE funcionario(
	codf int, 
	nome varchar(40),
	salario real,
	cidade varchar(40),
	horas int,
	--vamos criar uma restrição/constraint
	CONSTRAINT pk_funcionario PRIMARY KEY(codf)
);

--vamos inserir uma linha
INSERT INTO funcionario VALUES(
	1,'Fabiano', 2000,'Votuporanga',40
);

INSERT INTO funcionario VALUES(
	1,'Gabriela',2300,'Jales',20
);

SELECT * FROM funcionario;

