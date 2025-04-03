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
					  