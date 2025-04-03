CREATE TABLE MARCAS (CodigoM int,
					 NomeM varchar(40),
				     PaisOrigem varchar(40),
					 CONSTRAINT pk_MARCAS PRIMARY KEY(CodigoM)
);

INSERT INTO MARCAS VALUES  (1012, 'VolksWagen', 'Brasil'),
						   (1013, 'Fiat', 'Brasil'),
						   (1014, 'Audi', 'Alemanha'),
						   (1015, 'Chevrolet', 'Brasil'),
						   (1016, 'Chevrolet','USA');

SELECT * FROM MARCAS;

CREATE TABLE MODELOS (CodigoMo int,
					  NomeMo varchar(40),
					  TipoMo varchar(40),
					  CorMo varchar(40),
					  CodigoM int,
					  CONSTRAINT pk_MODELOS PRIMARY KEY(CodigoMo)
);

INSERT INTO MODELOS VALUES (101, 'Gol', 'GT', 'Cinza', 1012),
(102, 'Pálio', 'XS', 'Preto', 1013),
(103,'Zafira','GLS','Verde', 1015),
(104,'Linea', 'GL', 'Cinza', 1013),
(105, 'A3', 'GT', 'Preto', 1014),
(106, 'Polo', 'GL', 'Cinza', 1012),
(107, 'Taurus', 'XLS', 'Preto', 1016);

SELECT * FROM MODELOS;

SELECT marcas.nomem, modelos.cormo FROM marcas, modelos
WHERE modelos.cormo='Verde' AND modelos.codigom=marcas.codigom;

--vamos apagar a tabela MODELOS e criar com chave estrangeira

DROP TABLE MODELOS;

-- criando com chave estrangeira

CREATE TABLE MODELOS (CodigoMo int,
					  NomeMo varchar(40),
					  TipoMo varchar(40),
					  CorMo varchar(40),
					  CodigoM int,
					  CONSTRAINT pk_MODELOS PRIMARY KEY(CodigoMo),
					  CONSTRAINT fk_MARCAS_MODELOS FOREIGN KEY (CodigoM) REFERENCES MARCAS(CodigoM)
);

--PERGUNTAS DA PROVA

--1) QUAL O NOME DA MARCA DO CARRO ZAFIRA?

SELECT marcas.nomem, modelos.nomemo
	FROM MARCAS INNER JOIN MODELOS
	ON marcas.codigom=modelos.codigom
	WHERE modelos.nomemo='Zafira';
	
--2) QUAL O PAÍS QUE FABRICA O CARRO A3?

SELECT marcas.paisorigem, modelos.nomemo
	FROM MARCAS INNER JOIN MODELOS
	ON marcas.codigom=modelos.codigom
	WHERE modelos.nomemo='A3';
	
--3) QUAL A COR DO CARRO QUE TEM O TIPO DE MODELO XS? QUAL É A MARCA DELE?

SELECT modelos.tipomo, modelos.cormo, marcas.nomem
	FROM MARCAS INNER JOIN MODELOS
	ON marcas.codigom=modelos.codigom
	WHERE modelos.tipomo='XS';
	
--4) QUAL O NOME DO MODELO E O NOME DA MARCA DOS CARROS DE COR PRETA?

SELECT modelos.nomemo, marcas.nomem, modelos.cormo
	FROM MARCAS INNER JOIN MODELOS
	ON marcas.codigom=modelos.codigom
	WHERE modelos.cormo='Preto';
	
--5) QUAIS OS CARROS QUE A CHEVROLET DO BRASIL FABRICA?

SELECT modelos.nomemo, marcas.nomem, marcas.paisorigem
	FROM MARCAS INNER JOIN MODELOS
	ON marcas.codigom=modelos.codigom
	WHERE marcas.paisorigem='Brasil' AND marcas.nomem='Chevrolet';
	
--A função count() é utilizada para contar as ocorrências dentro de um SELECT. 
--Ele não mostra resposta, mas mostra quantas linhas foram encontradas.
--Seu uso: count(NomeDoCampo)

SELECT COUNT(modelos.nomemo) AS
	"Quantidade de carros pretos"
	FROM MODELOS
	WHERE modelos.cormo='Preto';
	
--QUANTOS CARROS SÃO PRODUZIDOS PELA VOLKSWAGEN? UTILIZE COUNT().

SELECT COUNT(modelos.nomemo) AS
	"Quantidade de carros produzidos pela VolksWagen"
	FROM MARCAS INNER JOIN MODELOS
	ON marcas.codigom = modelos.codigom
	WHERE marcas.nomem='VolksWagen';