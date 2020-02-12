SELECT RazaoSocial, NomeClinica, CNPJ, Endereco, Telefone,  FROM Clinica;

SELECT Titulo FROM TipoUsuario;

SELECT Email, Senha, Titulo FROM Usuario
INNER JOIN TipoUsuario ON Usuario.IdTipoUsuario = TipoUsuario.IdTipoUsuario;

SELECT Situacao FROM Situacao;

SELECT TipoEspecialidade FROM Especialidade;

SELECT NomePaciente, RG, Endereco, Telefone, Email, Senha, Enfermidade FROM Paciente
INNER JOIN Usuario ON Paciente.IdUsuario = Usuario.IdUsuario;

SELECT NomeMedico, CRM, TipoEspecialidade, Email, Senha, RazaoSocial, CNPJ, Endereco FROM Medico
INNER JOIN Usuario ON Medico.IdUsuario = Usuario.IdUsuario
INNER JOIN Especialidade ON Medico.IdEspecialidade = Especialidade.IdEspecialidade
INNER JOIN Clinica ON Medico.IdClinica = Clinica.IdClinica;

SELECT RazaoSocial, NomeClinica, Medico.NomeMedico, CRM, TipoEspecialidade, DataConsulta, Paciente.NomePaciente, Paciente.DataNascimento, Paciente. Telefone, Paciente.Enfermidade, Situacao FROM Consulta
INNER JOIN Medico ON Consulta.IdMedico = Medico.IdMedico
INNER JOIN Paciente ON Consulta.IdPaciente = Paciente.IdPaciente
INNER JOIN Situacao ON Consulta.IdSituacao = Situacao.IdSituacao 
INNER JOIN Especialidade ON Medico.IdEspecialidade = Especialidade.IdEspecialidade
INNER JOIN Clinica ON Medico.IdClinica = Clinica.IdClinica;


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