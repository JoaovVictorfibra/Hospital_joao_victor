CREATE DATABASE hospital_joao_victor;

USE hospital_joao_victor;

CREATE TABLE Convenio (
convenio_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
nome VARCHAR(50) NOT NULL,
cnpj VARCHAR(18) NOT NULL,
tempo_de_carencia DATE NOT NULL
);

CREATE TABLE Medico (
medico_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
nome VARCHAR(50) NOT NULL,
data_nascimento DATE NOT NULL,
endereco VARCHAR(90) NOT NULL,
telefone VARCHAR(15) NOT NULL,
email VARCHAR(70) NOT NULL
);

CREATE TABLE Especialidade (
especialidade_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
especialidade VARCHAR(60) NOT NULL
);

CREATE TABLE Enfermeiro (
enfermeiro_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
nome VARCHAR(50) NOT NULL,
cpf VARCHAR (15) NOT NULL,
crea VARCHAR (15) NOT NULL
);

CREATE TABLE Tipo_de_Quarto (
tipo_de_quarto_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
valor_diaria DECIMAL(6,2) NOT NULL,
descricao VARCHAR(200) NOT NULL
);

CREATE TABLE Paciente (
paciente_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
nome VARCHAR(50) NOT NULL,
data_nascimento DATE NOT NULL,
endereco VARCHAR(90) NOT NULL,
telefone VARCHAR(15) NOT NULL,
rg VARCHAR(11) NOT NULL,
cpf varchar(12) NOT NULL,
email VARCHAR(70) NOT NULL,
convenio_id INT NOT NULL,
FOREIGN KEY(convenio_id) REFERENCES convenio (convenio_id)
);


CREATE TABLE Quarto (
quarto_id iNT PRIMARY KEY NOT NULL AUTO_INCREMENT,
numero INT NOT NULL,
tipo_de_quarto_id INT NOT NULL,
FOREIGN KEY (tipo_de_quarto_id) REFERENCES tipo_de_quarto (tipo_de_quarto_id)
);

CREATE TABLE Internacao (
internacao_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
data_entrada DATE NOT NULL,
data_prev_alta DATE NOT NULL,
data_alta DATE NOT NULL,
procedimento VARCHAR(90) NOT NULL,
paciente_id INT NOT NULL,
medico_id INT NOT NULL,
quarto_id INT NOT NULL,
FOREIGN KEY (paciente_id) REFERENCES paciente (paciente_id),
FOREIGN KEY (medico_id) REFERENCES medico (medico_id),
FOREIGN KEY (quarto_id) REFERENCES quarto (quarto_id)

);

CREATE TABLE Enfermeiro_Internacao(
enfermeiro_id INT NOT NULL,
internacao_id INT NOT NULL,
FOREIGN KEY(enfermeiro_id) REFERENCES enfermeiro(enfermeiro_id),
FOREIGN KEY(internacao_id) REFERENCES internacao(internacao_id)
);

CREATE TABLE Medico_especialista (
medico_especialista_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
medico_id INT NOT NULL,
especialidade_id INT NOT NULL,
FOREIGN KEY(medico_id) REFERENCES medico (medico_id),
FOREIGN KEY(especialidade_id) REFERENCES especialidade(especialidade_id)
);

CREATE TABLE Consulta (
consulta_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
data_consulta DATE NOT NULL,
hora_consulta TIME NOT NULL,
valor DECIMAL(6,2) NOT NULL,
medico_id INT NOT NULL,
paciente_id INT NOT NULL,
convenio_id INT NOT NULL,
especialidade_id INT NOT NULL,
FOREIGN KEY(medico_id) REFERENCES medico (medico_id),
FOREIGN KEY(paciente_id) REFERENCES paciente(paciente_id),
FOREIGN KEY(convenio_id) REFERENCES convenio (convenio_id),
FOREIGN KEY(especialidade_id) REFERENCES especialidade (especialidade_id)

);

CREATE TABLE Receita_Medica (
receita_medica_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
medicamentos VARCHAR(50) NOT NULL,
quantidade INT NOT NULL,
instrucoes VARCHAR(150) NOT NULL,
consulta_id INT NOT NULL,
FOREIGN KEY(consulta_id) REFERENCES consulta (consulta_id)
);