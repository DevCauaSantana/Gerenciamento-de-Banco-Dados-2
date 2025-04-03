--TABELA EMPREGADO

CREATE TABLE EMPREGADO(Nome varchar (40),
					   RG int,
					   CIC int,
					   Depto int,
					   RG_Supervisor varchar (40),
					   Salario real,
					   CONSTRAINT pk_EMPREGADO PRIMARY KEY(RG)
);

INSERT INTO EMPREGADO VALUES ('João Luiz', 10101010, 11111111, 1, 'NULO', 3000),
							 ('Fernando', 20202020, 22222222, 2, '10101010', 2500),
							 ('Ricardo', 30303030, 33333333, 2, '10101010', 2300),
							 ('Jorge', 40404040, 44444444, 2, '20202020', 4200),
							 ('Renato', 50505050, 55555555, 3, '20202020', 1300);
							 
SELECT * FROM EMPREGADO;



--TABELA DEPENDENTES

CREATE TABLE DEPENDENTES(RG_Responsavel int,
						 Nome_Dependente varchar(40),
						 Dt_Nascimento date,
						 Relacao varchar (40),
						 Sexo varchar (40),
						 CONSTRAINT pk_DEPENDENTES PRIMARY KEY (Nome_Dependente),
						 CONSTRAINT fk_EMPREGADO_DEPENDENTES FOREIGN KEY (RG_Responsavel) REFERENCES EMPREGADO(RG)
);

INSERT INTO DEPENDENTES VALUES (10101010, 'Jorge', '27-12-1986', 'Filho', 'Masculino'),
							   (10101010, 'Luiz', '18-11-1979', 'Filho', 'Masculino'),
							   (20202020, 'Fernanda', '14-02-1969', 'Conjuge', 'Feminino'),
							   (20202020, 'Angelo', '10-02-1995', 'Filho', 'Masculino'),
							   (30303030, 'Adreia', '10-05-1990', 'Filho', 'Feminino');

SELECT * FROM DEPENDENTES;

--a)
SELECT dependentes.nome_dependente, dependentes.relacao, empregado.rg
		FROM DEPENDENTES INNER JOIN EMPREGADO
		ON dependentes.rg_responsavel = empregado.rg
		WHERE empregado.rg = 30303030;
		
--b)
SELECT nome_dependente, dt_nascimento, relacao FROM DEPENDENTES
		WHERE relacao = 'Filho';
		
--c)
SELECT nome_dependente, sexo, relacao FROM DEPENDENTES
	    WHERE relacao = 'Conjuge';
		
--d)
SELECT empregado.nome, empregado.rg, empregado.cic, empregado.depto, dependentes.relacao 
        FROM DEPENDENTES INNER JOIN EMPREGADO
		ON dependentes.rg_responsavel = empregado.rg
		WHERE dependentes.relacao = 'Filho';
		
--e)
SELECT dependentes.nome_dependente, dependentes.relacao, dependentes.sexo, empregado.nome
		FROM DEPENDENTES INNER JOIN EMPREGADO
		ON dependentes.rg_responsavel = empregado.rg
		WHERE empregado.nome = 'Fernando';

--f)
SELECT empregado.nome, dependentes.nome_dependente
		FROM DEPENDENTES INNER JOIN EMPREGADO
		ON dependentes.rg_responsavel = empregado.rg
		WHERE dependentes.nome_dependente = 'Angelo';
		
--g)
SELECT empregado.salario, empregado.nome, dependentes.nome_dependente
	   FROM DEPENDENTES INNER JOIN EMPREGADO
	   ON dependentes.rg_responsavel = empregado.rg
	   WHERE dependentes.nome_dependente = 'Fernanda';
	   
--h)
SELECT empregado.nome, empregado.salario, dependentes.nome_dependente
		FROM DEPENDENTES INNER JOIN EMPREGADO
		ON dependentes.rg_responsavel = empregado.rg
		WHERE empregado.salario > 3000;
		
--i)
SELECT empregado.nome, dependentes.relacao, empregado.salario
		FROM DEPENDENTES INNER JOIN EMPREGADO
		ON dependentes.rg_responsavel = empregado.rg
		WHERE dependentes.relacao = 'Conjuge';
		
--j)
SELECT rg_responsavel, nome_dependente FROM DEPENDENTES
		WHERE sexo = 'Masculino';















