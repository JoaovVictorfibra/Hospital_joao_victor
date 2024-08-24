USE hospital_joao_victor;

-- consulta 1: todos os valores de consulta sem convenio 2020.
SELECT *,
       AVG(valor) OVER() AS valor_medio_consultas_sem_convenio_2020
FROM Consulta
WHERE convenio_id IS NULL
  AND YEAR(data_consulta) = 2020;
  
-- consulta 2: valor medio de consulta com convenio 2020

SELECT *, AVG(valor) OVER() AS valor_medio_consulta_com_convenio_2020
FROM Consulta
WHERE convenio_id IS NOT NULL
AND YEAR(data_consulta) = 2020;

-- consulta 3: todas as internaçoes que a data de alta e maior que a prevista.
SELECT * FROM Internacao
WHERE data_alta > data_prev_alta;

-- consulta 4: receituario completo da primeira consulta registrada
SELECT Receita_medica.*
FROM Receita_medica
JOIN consulta ON Receita_medica.consulta_id = Consulta.consulta_id
ORDER BY Consulta.data_consulta, Consulta.hora_consulta
limit 1;

-- consulta 5: as consultas de maior valor é menor 
(SELECT * FROM consulta
WHERE convenio_id IS NULL
ORDER BY valor DESC
LIMIT 1)
UNION
(SELECT * FROM consulta 
WHERE convenio_id IS NULL
ORDER BY valor ASC
LIMIT 1);

-- consulta 6: todos os dados das internaçoes em seus respectivos quartos.
SELECT i.*,
q.numero,
q.tipo_de_quarto_id,
tq.descricao,
tq.valor_diaria,
DATEDIFF(I.data_alta, i.data_entrada) * tq.valor_diaria AS total_internacao
FROM internacao i
JOIN quarto q ON i.quarto_id = q.quarto_id
JOIN tipo_de_quarto tq ON q.tipo_de_quarto_id = tq.tipo_de_quarto_id;

-- consulta 7: Data, procedimento e internaçoes em quartos do tipo apartamento.
SELECT i.data_entrada,
i.procedimento,
q.numero AS numero_quarto
FROM internacao i
JOIN quarto q ON i.quarto_id = q.quarto_id
JOIN tipo_de_quarto tq ON q.tipo_de_quarto_id = tq.tipo_de_quarto_id
WHERE tq.descricao = 'Apartamento';

-- consulta 8: nome, data da consulta, especialidade de pacientes menores de idade.
SELECT p.nome AS nome_paciente,
c.data_consulta,
e.especialidade
FROM Consulta c
JOIN Paciente p ON c.paciente_id = p.paciente_id
JOIN Especialidade e ON c.especialidade_id = e.especialidade_id
WHERE TIMESTAMPDIFF(YEAR, p.data_nascimento, c.data_consulta) < 18
AND e.especialidade <> 'pediatria'
ORDER BY c.data_consulta ASC;

-- consulta 9:
SELECT p.nome AS nome_paciente,
m.nome AS nome_medico,
i.data_entrada,
i.procedimento
FROM Internacao i
JOIN Paciente p ON i.paciente_id = p.paciente_id
JOIN medico m ON i.medico_id = m.medico_id
JOIN medico_especialista me ON m.medico_id = me.medico_id
JOIN Especialidade e ON me.especialidade_id = e.especialidade_id
JOIN quarto q ON i.quarto_id = q.quarto_id
JOIN tipo_de_quarto tq ON q.tipo_de_quarto_id = tq.tipo_de_quarto_id
WHERE e.especialidade = 'Gastroenterologia'
AND tq.descricao = 'Enfermaria';

-- consulta 10: os nomes dos medicos, e seus numerosde registro no crm.
SELECT m.nome AS nome_medico, 
       m.crm, 
       COUNT(c.consulta_id) AS quantidade_consultas
FROM Medico m
JOIN Consulta c ON m.medico_id = c.medico_id
GROUP BY m.nome, m.crm;

-- consulta 11: os nomes e numero CREA.
SELECT e.nome, e.crea AS CRE, COUNT(ei.internacao_id) AS numero_internacoes
FROM Enfermeiro e
JOIN Enfermeiro_Internacao ei ON e.enfermeiro_id = ei.enfermeiro_id
GROUP By e.nome, e.crea
HAVING COUNT(ei.internacao_id) > 1;

-- Consulta 1: Todos os dados e o valor médio das consultas do ano de 2020 realizadas sem convênio
SELECT *, AVG(valor) AS valor_medio
FROM Consulta
WHERE YEAR(data_consulta) = 2020 AND convenio_id IS NULL;

-- Consulta 2: Todos os dados e o valor médio das consultas do ano de 2020 realizadas por convênio
SELECT *, AVG(valor) AS valor_medio
FROM Consulta
WHERE YEAR(data_consulta) = 2020 AND convenio_id IS NOT NULL;

-- Consulta 3: Todos os dados das internações que tiveram data de alta maior que a data prevista para a alta
SELECT *
FROM Internacao
WHERE data_alta > data_prev_alta;

-- Consulta 4: Receituário completo da primeira consulta registrada com receituário associado
SELECT *
FROM Receita_Medica
WHERE consulta_id = (SELECT MIN(consulta_id) FROM Receita_Medica);

-- Consulta 5: Todos os dados da consulta de maior valor e também da de menor valor (ambas as consultas não foram realizadas sob convênio)
(SELECT *
FROM Consulta
WHERE convenio_id IS NULL
ORDER BY valor DESC
LIMIT 1)
UNION
(SELECT *
FROM Consulta
WHERE convenio_id IS NULL
ORDER BY valor ASC
LIMIT 1);

-- Consulta 6: Todos os dados das internações em seus respectivos quartos, calculando o total da internação a partir do valor de diária do quarto e o número de dias entre a entrada e a alta
SELECT i.*, q.numero AS numero_quarto, tq.descricao AS tipo_quarto,
DATEDIFF(i.data_alta, i.data_entrada) * tq.valor_diaria AS total_internacao
FROM Internacao i
JOIN Quarto q ON i.quarto_id = q.quarto_id
JOIN Tipo_de_Quarto tq ON q.tipo_de_quarto_id = tq.tipo_de_quarto_id;

-- Consulta 7: Data, procedimento e número de quarto de internações em quartos do tipo “apartamento”
SELECT i.data_entrada, i.procedimento, q.numero
FROM Internacao i
JOIN Quarto q ON i.quarto_id = q.quarto_id
JOIN Tipo_de_Quarto tq ON q.tipo_de_quarto_id = tq.tipo_de_quarto_id
WHERE tq.descricao = 'Apartamento';

-- Consulta 8: Nome do paciente, data da consulta e especialidade de todas as consultas em que os pacientes eram menores de 18 anos na data da consulta e cuja especialidade não seja “pediatria”, ordenando por data de realização da consulta
SELECT p.nome AS paciente, c.data_consulta, e.especialidade
FROM Consulta c
JOIN Paciente p ON c.paciente_id = p.paciente_id
JOIN Especialidade e ON c.especialidade_id = e.especialidade_id
WHERE TIMESTAMPDIFF(YEAR, p.data_nascimento, c.data_consulta) < 18
AND e.especialidade != 'Pediatria'
ORDER BY c.data_consulta;

-- Consulta 9: Nome do paciente, nome do médico, data da internação e procedimentos das internações realizadas por médicos da especialidade “gastroenterologia”, que tenham acontecido em “enfermaria”
SELECT p.nome AS paciente, m.nome AS medico, i.data_entrada, i.procedimento
FROM Internacao i
JOIN Paciente p ON i.paciente_id = p.paciente_id
JOIN Medico m ON i.medico_id = m.medico_id
JOIN Medico_especialista me ON m.medico_id = me.medico_id
JOIN Especialidade e ON me.especialidade_id = e.especialidade_id
JOIN Quarto q ON i.quarto_id = q.quarto_id
JOIN Tipo_de_Quarto tq ON q.tipo_de_quarto_id = tq.tipo_de_quarto_id
WHERE e.especialidade = 'Gastroenterologia' AND tq.descricao = 'Enfermaria';

-- Consulta 10: Os nomes dos médicos, seus números de registro no CRM e a quantidade de consultas que cada um realizou
SELECT m.nome, m.medico_id AS CRM, COUNT(c.consulta_id) AS quantidade_consultas
FROM Medico m
JOIN Consulta c ON m.medico_id = c.medico_id
GROUP BY m.nome, m.medico_id;

-- Consulta 11: Os nomes, os números de registro no CRE dos enfermeiros que participaram de mais de uma internação e os números de internações referentes a esses profissionais.
SELECT e.nome, e.crea AS CRE, COUNT(ei.internacao_id) AS numero_internacoes
FROM Enfermeiro e
JOIN Enfermeiro_Internacao ei ON e.enfermeiro_id = ei.enfermeiro_id
GROUP BY e.nome, e.crea
HAVING COUNT(ei.internacao_id) > 1;

-- Consulta Extra: Identifique todos os pacientes que tiveram tanto consultas quanto internações durante o ano de 2020 e o número total de procedimentos realizados (consultas + internações).
SELECT p.nome, 
    COUNT(DISTINCT c.consulta_id) AS total_consultas,
    COUNT(DISTINCT i.internacao_id) AS total_internacoes,
    (COUNT(DISTINCT c.consulta_id) + COUNT(DISTINCT i.internacao_id)) AS total_procedimentos,
    SUM(c.valor) AS soma_valor_consultas
FROM Paciente p
LEFT JOIN Consulta c ON p.paciente_id = c.paciente_id AND YEAR(c.data_consulta) = 2020
LEFT JOIN Internacao i ON p.paciente_id = i.paciente_id AND YEAR(i.data_entrada) = 2020
GROUP BY p.nome
HAVING total_procedimentos > 0;
SELECT p.nome,
COUNT(DISTINCT c.consulta_id) AS total_consulta,
COUNT(DISTINCT i.internacao_id) AS total_internacoes,
(COUNT(DISTINCT c.consulta_id) + COUNT(DISTINCT i.internacao_id)) AS total_procedimentos,
SUM(c.valor) AS soma_valor_consultas
FROM Paciente p
LEFT JOIN consulta c ON p.paciente_id = c.paciente_id AND YEAR(C.data_consulta) = 2020
LEFT JOIN Internacao i ON p.paciente_id = i.paciente_id AND YEAR(i.data_entrada) = 2020
GROUP BY p.nome
HAVING total_procedimentos > 0;