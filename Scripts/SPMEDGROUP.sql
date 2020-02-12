-----------------------------------------------------------------DDL-------------------------------------------------------------------------------------------------

CREATE DATABASE SP_Medical_Group
GO
USE SP_Medical_Group
GO

CREATE TABLE TipoUsuario(
IdTipoUsuario INT PRIMARY KEY IDENTITY ,
Titulo VARCHAR (200) NOT NULL UNIQUE
);
GO

CREATE TABLE Situacao(
IdSituacao INT PRIMARY KEY IDENTITY,
Situacao VARCHAR (200) NOT NULL
);
GO

CREATE TABLE Especialidade(
IdEspecialidade INT PRIMARY KEY IDENTITY,
TipoEspecialidade VARCHAR (200) NOT NULL
);
GO

CREATE TABLE Clinica(
IdClinica INT PRIMARY KEY IDENTITY,
RazaoSocial VARCHAR (200) NOT NULL,
CNPJ VARCHAR (100) NOT NULL UNIQUE,
Endereco VARCHAR (200) NOT NULL UNIQUE,
Telefone VARCHAR (100) NOT NULL
);
GO

CREATE TABLE Usuario(
IdUsuario INT PRIMARY KEY IDENTITY,
Email VARCHAR (200) NOT NULL UNIQUE,
Senha  VARCHAR (200) NOT NULL,
IdTipoUsuario INT FOREIGN KEY REFERENCES TipoUsuario (IdTipoUsuario)
);
GO

CREATE TABLE Paciente(
IdPaciente INT PRIMARY KEY IDENTITY,
NomePaciente VARCHAR (200)NOT NULL,
RG VARCHAR (100) NOT NULL UNIQUE,
Endereco VARCHAR (200) NOT NULL,
Telefone VARCHAR (100) NOT NULL,
Enfermidade VARCHAR (200) NOT NULL,
DataNascimento Date  NOT NULL,
IdUsuario INT FOREIGN KEY REFERENCES Usuario (IdUsuario)
);
GO

CREATE TABLE Medico(
IdMedico INT PRIMARY KEY IDENTITY,
NomeMedico VARCHAR (200) NOT NULL,
CRM VARCHAR (100) NOT NULL UNIQUE,
IdUsuario INT FOREIGN KEY REFERENCES Usuario (IdUsuario),
IdEspecialidade INT FOREIGN KEY REFERENCES Especialidade (IdEspecialidade)
);
GO

CREATE TABLE Consulta(
IdConsulta INT PRIMARY KEY IDENTITY,
DataConsulta DATETIME2 NOT NULL,
IdMedico INT FOREIGN KEY REFERENCES Medico (IdMedico),
IdPaciente INT FOREIGN KEY REFERENCES Paciente (IdPaciente),
IdSituacao INT FOREIGN KEY REFERENCES Situacao (IdSituacao),
);
GO

-----------------------------------------------------------------DML-------------------------------------------------------------------------------------------------

INSERT INTO TipoUsuario (Titulo)
VALUES ('Paciente'),
('Médico'),
('ADM.');
GO

INSERT INTO Usuario(Email, Senha, IdTipoUsuario)
VALUES ('nalaura@email.com', '123', 1),
('niko@email.com', '123', 1),
('cadu@email.com', '123', 2),
('adm@email.com', '123', 3),
('lais@email.com', '123', 2);
GO

INSERT INTO Situacao (Situacao)
VALUES ('Agendada'),
('Confirmada'),
('Cancelada');
GO

INSERT INTO Especialidade(TipoEspecialidade)
VALUES ('Psiquiatria'),
('Neurologista');
GO

INSERT INTO Paciente(NomePaciente, RG, Endereco, Telefone, Enfermidade, DataNascimento, IdUsuario)
VALUES ('Nicolas', 2143234, 'Av. Imperador, 257', 9956546546, 'Retardo mental', '13-08-2003', 2),
('Ana Laura', 3432432, 'Aldeia Mogi, 25', 9975777948, 'Sistema Neurológico debilitado', '09-08-2001', 1);
GO

INSERT INTO Medico(NomeMedico, CRM, IdUsuario, IdEspecialidade)
VALUES ('Carlos', 43543534, 3, 1),
('Lais', 43243256, 5, 2);
GO

INSERT INTO Consulta(DataConsulta, IdMedico, IdPaciente, IdSituacao)
VALUES ('11-02-20', 1, 1, 2),
('12-02-2020', 2, 2, 1);
GO

INSERT INTO Clinica(RazaoSocial, CNPJ, Endereco, Telefone)
VALUES ('SP Medical Group', 1111111111,'Rua Augusta, 580', 40028922);
GO

-----------------------------------------------------------------DQL-------------------------------------------------------------------------------------------------

SELECT RazaoSocial, CNPJ, Endereco, Telefone FROM Clinica;

SELECT Titulo FROM TipoUsuario;

SELECT Email, Senha, Titulo FROM Usuario
INNER JOIN TipoUsuario ON Usuario.IdTipoUsuario = TipoUsuario.IdTipoUsuario;

SELECT Situacao FROM Situacao;

SELECT TipoEspecialidade FROM Especialidade;

SELECT Nome, RG, Endereco, Telefone, Email, Senha, Enfermidade FROM Paciente
INNER JOIN Usuario ON Paciente.IdUsuario = Usuario.IdUsuario;

SELECT Nome, CRM, TipoEspecialidade, Email, Senha FROM Medico
INNER JOIN Usuario ON Medico.IdUsuario = Usuario.IdUsuario
INNER JOIN Especialidade ON Medico.IdEspecialidade = Especialidade.IdEspecialidade;

SELECT * FROM Consulta
INNER JOIN Medico ON Consulta.IdMedico = Medico.IdMedico
INNER JOIN Paciente ON Consulta.IdPaciente = Paciente.IdPaciente
INNER JOIN Situacao ON Consulta.IdSituacao = Situacao.IdSituacao
INNER JOIN Especialidade ON Medico.IdEspecialidade = Especialidade.IdEspecialidade;

SELECT Medico.NomeMedico, CRM, TipoEspecialidade, DataConsulta, Paciente.NomePaciente, Paciente.DataNascimento, Paciente. Telefone, Paciente.Enfermidade, Situacao FROM Consulta
INNER JOIN Medico ON Consulta.IdMedico = Medico.IdMedico
INNER JOIN Paciente ON Consulta.IdPaciente = Paciente.IdPaciente
INNER JOIN Situacao ON Consulta.IdSituacao = Situacao.IdSituacao 
INNER JOIN Especialidade ON Medico.IdEspecialidade = Especialidade.IdEspecialidade;

SELECT COUNT (*) TipoEspecialidade 	
FROM Especialidade 
WHERE TipoEspecialidade = 'Psiquiatria';

SELECT
FORMAT(DataNascimento, 'dd/MM/yyyy') AS [DataNascimento],
CONVERT (VARCHAR,GETDATE(),1) AS [Dia de hoje],
DATEDIFF (YY,DataNascimento,GETDATE()) AS [Idade]
FROM Paciente

SELECT COUNT (*) IdUsuario
FROM Usuario