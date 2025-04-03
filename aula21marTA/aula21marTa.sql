--VAMOS CRIAR NOSSA PRIMEIRA TABELA CLIENTE 
CREATE TABLE CLIENTE(
	codcli int,
	nome varchar(40),
	endereco varchar(40),
	cidade varchar(25),
	estado char(2)
);

--PESQUISA INFORMAÇÕES NA TABELA
SELECT * FROM CLIENTE;

--VAMOS INSERIR VALORES NA TABELA
INSERT INTO CLIENTE VALUES(
1, 'Ana', 'Rua Sergipe, 3555', 'Votuporanga', 'SP');

INSERT INTO CLIENTE VALUES(
1, 'Roberto', 'Rua Amazonas, 667', 'Cosmorama', 'SP');