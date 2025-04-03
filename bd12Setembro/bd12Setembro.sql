CREATE TABLE FUNCIONARIO (Matricula int,
						  Nome varchar(40),
						  Data_de_Nascimento date,
						  Nacionalidade varchar(40),
						  Sexo varchar(40),
						  Estado_Civil varchar(40),
						  RG int,
						  CIC varchar(40),
						  Endereco varchar(40),
						  Telefone int,
						  Data_de_Admissao date,
						  CONSTRAINT pk_FUNCIONARIO PRIMARY KEY (Matricula)						  
);

SELECT * FROM FUNCIONARIO; 

CREATE TABLE CARGO(
				  id_Cargo int,	
				  Cargo varchar(40),
				  Descricao varchar(40),
				  CONSTRAINT pk_CARGO PRIMARY KEY (id_Cargo)
);
SELECT * FROM CARGO; 
CREATE TABLE CARGO_FUNCIONARIO(
				 Data_Inicio date,
				 Data_Fim date,
				 id_Cargo int,
	             Matricula int,
				 CONSTRAINT pk_CARGO_FUNCIONARIO PRIMARY KEY (id_Cargo, Matricula),
				 CONSTRAINT fk_CARGO_CARGO_FUNCIONARIO FOREIGN KEY (id_Cargo) REFERENCES CARGO (id_Cargo),
				 CONSTRAINT fk_FUNCIONARIO_CARGO_FUNCIONARIO FOREIGN KEY (Matricula) REFERENCES FUNCIONARIO (Matricula)
);

SELECT * FROM CARGO_FUNCIONARIO; 

SELECT * FROM  DEPENDENTES;

CREATE TABLE DEPENDENTES (id_Dependentes int,
						  Nome varchar(40),
						  Data_Nascimento date,
						  Matricula int,
						  CONSTRAINT fk_FUNCIONARIO_DEPENDENTES FOREIGN KEY (Matricula) REFERENCES FUNCIONARIO (Matricula)
);

