CREATE TABLE Medico(
	codiMedico varchar(40),
	Nome varchar(40),
	Especialidade varchar(40),
	Hospital varchar(40),
	Experiencia int,
	CONSTRAINT pk_Medico PRIMARY KEY(codiMedico)
);

INSERT INTO Medico VALUES
	('Med1', 'Júlio Batimento', 'Cardiovascular', 'Boa Saúde', 10),
	('Med2', 'Maria Velonge', 'Oftalmologia', 'Bom Retiro', 15),
	('Med3', 'Gabriel Curioso', 'Otorrino', 'Bom Retiro', 21),
	('Med4', 'Ana Veperto', 'Oftalmologia', 'Boa Saúde', 5),
	('Med5', 'Fábio Quebraoço', 'Osteopatia', 'Boa Saúde', 17),
	('Med6', 'Augusto Nunes', 'Pediatria', 'Santa Maria', 22);

SELECT * FROM Medico;