--3)

--TABELA FORNECEDORES

CREATE TABLE FORNECEDORES (codfor int,
					 fornecedor varchar(40),
					 CONSTRAINT pk_FORNECEDORES PRIMARY KEY(codfor)
);

INSERT INTO FORNECEDORES VALUES  (200, 'Bomdipreço'),
						   (201, 'Temditudo'),
						   (203, 'Sodubom'),
						   (204, 'Fhrescou'),
						   (205, 'Darozza');
						   
SELECT * FROM FORNECEDORES;

--TABELA CATEGORIAS

CREATE TABLE CATEGORIAS (codcat int,
					 descricao varchar(40),
					 codfor int,
					 CONSTRAINT pk_CATEGORIAS PRIMARY KEY(codcat),
				     CONSTRAINT fk_FORNECEDORES_CATEGORIAS FOREIGN KEY (codfor) REFERENCES FORNECEDORES(codfor)
);

INSERT INTO CATEGORIAS VALUES  (101, 'Cereal', 204),
						   (102, 'Refrigerante', 200),
						   (103, 'Doces', 203),
						   (104, 'Cosmético', 201),
						   (105, 'Higiene', 201),
						   (106, 'Frutas', 205);
						   
SELECT * FROM CATEGORIAS;

--TABELA PRODUTOS

CREATE TABLE PRODUTOS (codprod int,
					 nomeprod varchar(40),
					 preco real,
					 codcat int,
					 CONSTRAINT pk_PRODUTOS PRIMARY KEY(codprod),
				     CONSTRAINT fk_CATEGORIAS_PRODUTOS FOREIGN KEY (codcat) REFERENCES CATEGORIAS(codcat)
);

INSERT INTO PRODUTOS VALUES (1, 'Feijão Tia Maria', 14.00, 101),
							(2, 'Arroz Solthim', 9.00, 101),
							(3, 'Coca-Cola', 7.00, 102),
							(4, 'Shampo Jubba', 19.55, 104),
							(5, 'Bolacha Dabboa', 8.70, 103),
							(6, 'Bombom Dobhom', 15, 103),
							(7, 'Sabonete Xerobom', 3.99, 104),
							(8, 'Desinfetante', 5.00, 105),
							(9, 'Banana', 3.00, 106),
							(10, 'Coco da Bahia', 6.50, 106);
							
SELECT * FROM PRODUTOS;

--4)

SELECT nomeprod, preco FROM PRODUTOS;

--5)

--EXEMPLO QUEM É O FORNECEDORES DO FEIJÃO TIA MARIA
SELECT f.fornecedor, p.nomeprod
	FROM PRODUTOS p INNER JOIN CATEGORIAS c
	ON p.codcat = c.codcat INNER JOIN FORNECEDORES f
	ON f.codfor = c.codfor
	WHERE p.nomeprod='Feijão Tia Maria';

--a)
SELECT produtos.nomeprod, produtos.preco, fornecedores.fornecedor
	FROM PRODUTOS INNER JOIN CATEGORIAS
	ON produtos.codcat = categorias.codcat INNER JOIN FORNECEDORES
	ON fornecedores.codfor=categorias.codfor
	WHERE produtos.nomeprod='Arroz Solthim';
	
--b)
SELECT produtos.nomeprod, produtos.preco, categorias.descricao
	FROM PRODUTOS INNER JOIN CATEGORIAS
	ON produtos.codcat=categorias.codcat
	WHERE produtos.nomeprod='Feijão Tia Maria';
	
--c)
SELECT nomeprod, preco FROM PRODUTOS
	WHERE preco > 3;
	
--d)
SELECT produtos.nomeprod, categorias.descricao, produtos.preco
	FROM PRODUTOS INNER JOIN CATEGORIAS
	ON produtos.codcat=categorias.codcat
	WHERE produtos.preco < 5;
	
--e)
SELECT produtos.nomeprod, categorias.descricao, produtos.preco
	FROM PRODUTOS INNER JOIN CATEGORIAS
	ON produtos.codcat=categorias.codcat
	WHERE produtos.nomeprod = 'Bombom Dobhom';
	
--g)
SELECT produtos.nomeprod, categorias.descricao
	FROM PRODUTOS INNER JOIN CATEGORIAS
	ON produtos.codcat=categorias.codcat
	WHERE produtos.nomeprod = 'Coca-Cola';
	
--h)
SELECT descricao FROM CATEGORIAS;

--i)
SELECT produtos.nomeprod, fornecedores.codfor, fornecedores.fornecedor
	FROM PRODUTOS INNER JOIN CATEGORIAS
	ON produtos.codcat = categorias.codcat INNER JOIN FORNECEDORES
	ON fornecedores.codfor=categorias.codfor
	WHERE produtos.nomeprod='Coco da Bahia';
	
--j) 
SELECT SUM (preco) as "Quanto gastaria se comprasse um item de cada" FROM PRODUTOS;

--k) 
SELECT fornecedores.fornecedor
	FROM PRODUTOS INNER JOIN CATEGORIAS
	ON produtos.codcat = categorias.codcat INNER JOIN FORNECEDORES
	ON fornecedores.codfor=categorias.codfor
	WHERE produtos.nomeprod='Batata';
	
--l)
SELECT produtos.nomeprod, fornecedores.fornecedor
	FROM PRODUTOS INNER JOIN CATEGORIAS
	ON produtos.codcat = categorias.codcat INNER JOIN FORNECEDORES
	ON fornecedores.codfor=categorias.codfor
	WHERE produtos.nomeprod='Sabonete Xerobom';
	
--m)	
SELECT fornecedores.fornecedor, produtos.nomeprod, produtos.preco
	FROM PRODUTOS INNER JOIN CATEGORIAS
	ON produtos.codcat = categorias.codcat INNER JOIN FORNECEDORES
	ON fornecedores.codfor=categorias.codfor
	WHERE fornecedores.fornecedor='Fhrescou';	
	