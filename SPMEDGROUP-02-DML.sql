SELECT * FROM Clinica
SELECT * FROM TipoUsuario
SELECT * FROM Usuario
SELECT * FROM Situacao
SELECT * FROM Especialidade
SELECT * FROM Paciente
SELECT * FROM Medico
SELECT * FROM Consulta



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

INSERT INTO Paciente(Nome, RG, Endereco, Telefone, Enfermidade, DataNascimento, IdUsuario)
VALUES ('Nicolas', 2143234, 'Av. Imperador, 257', 9956546546, 'Retardo mental', '13-08-2003', 2),
('Ana Laura', 3432432, 'Aldeia Mogi, 25', 9975777948, 'Sistema Neurológico debilitado', '09-08-2001', 1);
GO

INSERT INTO Medico(Nome, CRM, IdUsuario, IdEspecialidade)
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

