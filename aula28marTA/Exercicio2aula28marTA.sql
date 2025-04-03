CREATE TABLE Paciente(
	codiPaciente int,
	Nome varchar(40),
	Cidade varchar(40),
	Estado char(2),
	Tratamento varchar(40),
	CONSTRAINT pk_Paciente PRIMARY KEY(codiPaciente)
);

INSERT INTO Paciente VALUES
	(111, 'Cláudio Henrique', 'São Paulo', 'SP', 'Cardiovascular'),
	(112, 'Maria Helena', 'Votuporanga', 'SP', 'Oftalmologia'),
	(113, 'Jorge Silva', 'Cardoso', 'SP', 'Otorrino'),
	(114, 'Clara Magalhães', 'Parisi', 'SP', 'Oftalmologia'),
	(115, 'Pedro Vieira', 'Votuporanga', 'SP', 'Osteopatia');

SELECT * FROM Paciente;