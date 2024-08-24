USE hospital_joao_victor;

INSERT INTO Receita_medica (medicamentos, quantidade, instrucoes, consulta_id)VALUES
('Paracetamol, Ibuprofeno', 20, 'tomar 1 comprimido de cada a cada 8 horas', 1),
('Amoxicilina, Omeprazol', 30, 'Tomar Amoxicilina a cada 8 horas e Omeprazol antes do cafe', 2),
('Losartana, Metformina', 60, 'tomar 1 comprimido de cada pela manhã e á noite', 3),
('Azitromicina, Prednisona', 18, 'tomar 1 comprimido de azitromicina por dia e prednisona a cada 12 horas', 4),
('Aspirina, Ranitidina', 40, 'Tomar 1 comprimido de Aspirina após as refeições e Ranitidina antes de dormir',5);

INSERT INTO Convenio (nome, cnpj, tempo_de_carencia) VALUES
('Convenio Saúde A', '12.345.678/001-90', '2024-08-20'),
('Convenio Vida B', '98.765.432/0001-80', '2024-09-01'),
('Convenio Bem C', '11.222.333/0001-70', '2024-07-15'),
('Convenio popular D', '44.555.567/0001-60', '2024-06-30');

INSERT INTO consulta(data_consulta, hora_consulta, valor, medico_id, paciente_id, convenio_id, especialidade_id) VALUES
('2022-05-10', '10:30:00', 150.00, 1, 1, 1 , 2),
('2021-03-22', '11:00:00', 120.00, 2, 2, 2, 4),
('2020-07-18', '09:00:00', 180.00, 3, 3, 3, 3),
('2019-11-05', '14:30:00', 160.00, 4, 4, 1, 1),
('2018-02-14', '08:30:00', 130.00, 5, 5, 2, 5),
('2017-09-21', '16:00:00', 140.00, 6, 6, 4, 7),
('2020-12-12', '13:00:00', 110.00, 7, 7, 1, 6),
('2021-06-29', '15:30:00', 125.00, 8, 8, 3, 2),
('2019-04-17', '10:00:00', 135.00, 9, 9, 4, 4),
('2022-10-08', '12:30:00', 145.00, 10, 10, 2, 1);

INSERT INTO Tipo_de_Quarto (valor_diaria, descricao) VALUES
(300.00, 'Apartamento'),
(200.00, 'Quarto Duplo'),
(100.00, 'Enfermaria');

INSERT INTO Quarto(numero, tipo_de_quarto_id) VALUES
(101, 1),
(102, 2),
(103, 3);

INSERT INTO Internacao (data_entrada, data_prev_alta, data_alta, procedimento, paciente_id, medico_id, quarto_id)
VALUE
('2017-01-15', '2017-01-20', '2017-01-19', 'Cirurgia', 1, 1, 1),
('2018-02-20', '2018-02-25', '2018-02-24', 'Tratamento', 2, 2, 2),
('2019-03-25', '2019-03-30', '2019-03-29', 'Internação Clínica', 3, 3, 3),
('2020-04-30', '2020-05-05', '2020-05-04', 'Cirurgia', 4, 4, 1),
('2021-05-05', '2021-05-10', '2021-05-09', 'Tratamento', 5, 5, 2),
('2022-06-10', '2022-06-15', '2022-06-14', 'Internação Clínica', 6, 6, 3),
('2022-07-15', '2022-07-20', '2022-07-19', 'Cirurgia', 7, 7, 1);

INSERT INTO Enfermeiro_Internacao (internacao_id, enfermeiro_id) VALUES
-- Internação 1
(1, 1), 
(1, 2),

-- Internação 2
(2, 3), 
(2, 4),

-- Internação 3
(3, 5), 
(3, 6),

-- Internação 4
(4, 1), 
(4, 3),

-- Internação 5
(5, 2), 
(5, 4),

-- Internação 6
(6, 5), 
(6, 6),

-- Internação 7
(7, 1), 
(7, 2);
