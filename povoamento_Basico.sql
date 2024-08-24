USE hospital_joao_victor;

INSERT INTO especialidade (especialidade) VALUES
('Pediatria'),
('clinica Geral'),
('Gastroenterologia'),
('Dermatologia'),
('Cardiologia'),
('Ortopedia'),
('Neurologia');

INSERT INTO medico (nome, data_nascimento, endereco, telefone, email)
VALUES 
('Dr. João Silva', '1975-03-12', 'Rua A, 123', '(11) 98765-4321', 'joao.silva@hotmail.com'),
('Dra. Maria Souza', '1980-07-05', 'Rua B, 456', '(11) 97654-3210', 'maria.souza@gmail.com'),
('Dr. Pedro Lima', '1982-02-15', 'Rua C, 789', '(21) 988877-6543', 'pedor.lima@hotmail..com'),
('Dra. Ana Oliveira', '1978-10-20', 'Rua D, 321', '(11) 99876-5432', 'Ana.oliveira@gmail.com'),
('Dr. Lucas Fernandas', '1985-12-25', 'Rua E, 654', '(11) 98987-8765', 'lucas.fernandes@hotmail.com'),
('Dra. Paula Costa', '1990-01-30', 'Rua f, 987', '(11) 99988-7654',  'paula.costa@hotmail.com'),
('Dr. Ricardo Alves', '1970-08-30', 'Rua G, 147', '(11) 99777- 5432', 'ricardo.alves@gmail.com'),
('Dra. Fernanda Lima', '1988-11-22', 'Rua H, 258', '(11) 99887-8543', 'fernanda.lima@hotmail.com'),
('Dr. Eduardo Ribeiro', '1977-05-28', 'Rua I, 369', '(11) 98775-5432', 'eduardo.ribeiro@gmail.com'),
('Dra. Carolina mendes', '1983-09-18', 'Rua J, 741', '(11) 98998-7654', 'carolina.mendes@gmail.com');

INSERT INTO Medico_Especialista (medico_id, especialidade_id) VALUES
(1, 2), -- Clínica Geral
(2, 4), -- Dermatologia
(3, 3), -- Gastroenterologia
(4, 1), -- Pediatria
(5, 5), -- Cardiologia
(6, 7), -- Neurologia
(7, 6), -- Ortopedia
(8, 2), -- Clínica Geral
(9, 4), -- Dermatologia
(10, 1); -- Pediatria

INSERT INTO Paciente (nome, data_nascimento, endereco, telefone, rg, cpf, email, convenio_id) VALUES
('Carlos Silva', '1995-03-10', 'Rua k, 159', '(11) 91234-5678',  '40.542.164-3', '993.942.978-98', 'Carlos.silva@gmail.com',1),
('Ana Pereira', '1987-07-23', 'Rua L, 754', '(11) 92345-6789', '33.780.934-3', '749.712.288-61', 'AnaPereira@hotmail.com',2),
('Pedro Santos', '1990-05-17', 'Rua M, 951', '(11) 93456-7890', '24.512.688-0', '629.704.648-45', 'PedroSantos@gmail.com',3),
('Maria Lima ', '2000-12-01', 'Rua N, 357', '(11) 98762-8676', '40.345.255-7', '543.015.858-50', 'MariaLima@hotmail.com',1),
('João Souza' , '1985-09-30', 'Rua O, 753', '(11) 95678-9012', '21.689.325-2', '317.004.868-61', 'JoaoSouza@gmail.com', 2),
('Fernanda Costa', '1992-04-15', 'Rua P, 159', '(11) 96789-0123','17.181.226-8', '950.001.078-02', 'FernadaCosta@hotmail.com', 4),
('Lucas Fernandes', '1983-11-19', 'Rua Q, 951', '(11) 97890-1234', '35.132.019-2', '297.776.878-50', 'LucasFernandes@gmail.com', 1),
('paula Oliveira', '1977-08-05', 'Rua R, 375', '(11) 98901-2345', '18.681.102-0', '216.327.008-40', 'PaulaOliveira@hotmail.com', 3),
('Eduardo Ribeiro', '1988-01-27', 'Rua S, 753', '(11) 99012-3456', '29.268.161-6', '603.621.458-81', 'EduardoRibeiro@gmail.com', 4),
('Carolina Mendes', '1979-02-10', 'Rua T, 159', '(11) 90123-4567', '42.682.373-4', '651.273.088-78', 'CarolinaMendes@hotmail.com', 2);

INSERT INTO Enfermeiro (nome, cpf, crea) VALUES
('Larisa Matos', '859.210.050-02','CREA-001'),
('Jessica Alves', '874.630.340-54' ,'CREA-002'),
('Romulo Cardoso', '624.506.080-01','CREA-003'),
('Carolina Cabelo', '429.046.140-95','CREA-004'),
('Henrique Barros', '619.632.890-56','CREA-005'),
('Felipe Aparecido', '219.046.110-36','CREA-006');
