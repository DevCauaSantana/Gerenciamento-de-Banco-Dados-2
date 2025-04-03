CREATE TABLE FORNECEDORES(
	idfor serial,
	nomef varchar(30),
	cidade varchar(40),
	estado varchar(2),
	CONSTRAINT pk_FORNECEDORES PRIMARY KEY (idfor)
);

--Vamos inserir alguns valores

INSERT INTO FORNECEDORES VALUES
	(DEFAULT, 'Garitá', 'Jales', 'SP'),
	(DEFAULT, 'Toninhas', 'Catanduva', 'SP'),
	(DEFAULT, 'Villages', 'Catanduva', 'SP'),
	(DEFAULT, 'Collonges', 'São Paulo', 'SP'),
	(DEFAULT, 'Brusk', 'Curitiba', 'PR'),
	(DEFAULT, 'Intercon', 'Campinas', 'SP'),
	(DEFAULT, 'Tekcno', 'Cascavel', 'PR');
	
SELECT * FROM FORNECEDORES;

--Imagine que você queria saber quantos fornecedores são da cidade de Catanduva.
--Para isso nós temos uma função que soma o número de ocorrências, ou seja, o número de registros. 
--Não é a soma de um determinado valor, mas a soma de registros. Assim, ao olharmos para nossa tabela,
--vemos que temos 2 ocorrências e é essa a resposta que o BD deve conceder

SELECT COUNT(cidade) AS "Fornecedores da cidade de Catanduva" FROM FORNECEDORES WHERE cidade= 'Catanduva';
	
--Vamos criar a tabela PRODUTOS

CREATE TABLE PRODUTOS(
	idprod serial,
	nomeprod varchar(30),
	peso real,
	valor real,
	ano_fab date,
	ano_val date,
	idfor int,
	CONSTRAINT pk_PRODUTOS PRIMARY KEY (idprod),
	CONSTRAINT fk_PRODUTOS_FORNECEDORES FOREIGN KEY (idfor) REFERENCES FORNECEDORES(idfor)
);

INSERT INTO PRODUTOS VALUES 
(DEFAULT, 'Calmante', 20, 45, '2023-03-22', '2024-03-22', 12),
(DEFAULT, 'Azitromicina', 100, 58, '2022-09-30', '2025-05-21', 14),
(DEFAULT, 'Dipirona', 100, 25, '2023-07-18', '2026-07-18', 8);

--Função AVG() é utilizada para encontrar a média de valores numéricos.
--Então, vamos encontrar a média dos valores das medicações.

SELECT AVG(valor) AS "Valor médio de todas as medicações:" FROM PRODUTOS; 

--O código ORDER BY serve para ordenar em crescente ou em decrescente, baseado em um campo da tabela,

SELECT * FROM PRODUTOS ORDER BY nomeprod ASC;

--Vamos colocar em ordem decrescente.

SELECT * FROM PRODUTOS ORDER BY nomeprod desc;

--O que mais eu posso mostrar em ordem crescente?

SELECT * FROM PRODUTOS ORDER BY valor asc;

--MAX() - Essa função é utilizada para encontrar o valor máximo dentro de um campo,
--que nesse caso, deve ser numérico,
--Vamos encontrar o maior valor.

SELECT MAX(valor) as "Valor máximo:" FROM PRODUTOS;

--MIN() - Essa função é utilizada para encontrar o valor mínimo dentro de um campo,
--que nesse caso, deve ser numérico.
--Vamos encontrar qual a menor dose das medicações.

SELECT MIN(peso) AS "Menor peso:" FROM PRODUTOS;

--Há uma função que consegue extrair dia/mês/ano de um campo do tipo date
--exemplo extract(day from campoDate) irá extrair o dia da referida data.
--Então vamos encontrar quais produtos possuem data de validade menor que 2025.

SELECT * FROM PRODUTOS WHERE extract (year from ano_val) < 2025;