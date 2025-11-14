drop schema bd_Consulta_Medica;
create database	bd_Consulta_Medica;
use bd_Consulta_Medica;

CREATE TABLE paciente (
  id_pac INT AUTO_INCREMENT PRIMARY KEY,
  nome_pac VARCHAR(100),
  telefone_pac VARCHAR(20),
  email_pac VARCHAR(100),
  data_nasc_pac DATE
);

CREATE TABLE especialidade (
  id_esp INT AUTO_INCREMENT PRIMARY KEY,
  nome_esp VARCHAR(50)
);

CREATE TABLE medico (
  id_med INT AUTO_INCREMENT PRIMARY KEY,
  nome_med VARCHAR(100),
  crm_med VARCHAR(20),
  id_esp_fk INT,
  FOREIGN KEY (id_esp_fk) REFERENCES especialidade(id_esp)
);

CREATE TABLE consulta (
  id_con INT AUTO_INCREMENT PRIMARY KEY,
  data_con DATE,
  horario_con TIME,
  observacoes_con TEXT,
  id_pac_fk INT,
  FOREIGN KEY (id_pac_fk) REFERENCES paciente(id_pac),
  id_med_fk INT,
  FOREIGN KEY (id_med_fk) REFERENCES medico(id_med)
);

CREATE TABLE pagamento (
  id_pag INT AUTO_INCREMENT PRIMARY KEY,
  valor_pag DECIMAL(8,2),
  forma_pag VARCHAR(20),
  status_pag VARCHAR(20),
  id_con_fk INT,
  FOREIGN KEY (id_con_fk) REFERENCES consulta(id_con)
);