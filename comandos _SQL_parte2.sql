USE hospital_joao_victor;

AlTER TABLE medico ADD em_atividade BIT DEFAULT 1;

UPDATE medico SET em_atividade = 0 WHERE medico_id IN (1, 2);
UPDATE medico SET em_atividade = 1 WHERE medico_id NOT IN (1, 2);

UPDATE Internacao i
JOIN quarto q ON i.quarto_id = q.quarto_id
JOIN tipo_de_quarto tq ON q.tipo_de_quarto_id = tq.tipo_de_quarto_id
SET i.data_alta = DATE_ADD(i.data_entrada, INTERVAL 3 DAY)
WHERE Tq.descricao = 'enfermaria';

set @ultimo_convenio_id = (SELECT MAX(convenio_id) FROM convenio);

DELETE FROM receita_medica WHERE consulta_id IN(SELECT consulta_id FROM consulta WHERE convenio_id = @ultimo_convenio_id);
DELETE FROM consulta WHERE convenio_id = @ultimo_convenio_id;
DELETE FROM paciente WHERE convenio_id = @ultimo_convenio_id;
DELETE FROM convenio WHERE convenio_id = @ultimo_convenio_id;