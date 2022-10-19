CREATE DATABASE taccuino;
USE taccuino;

CREATE TABLE taccuino_tb(
	data_voto DATE,
	id INT NOT NULL,
	nome NVARCHAR (30) NOT NULL,
	cognome NVARCHAR (30) NOT NULL,
	materia NVARCHAR (20) NOT NULL,
	voto DECIMAL NOT NULL,
	nome_docente NVARCHAR (30) NOT NULL,
	cognome_docente NVARCHAR (30) NOT NULL,
	classe SMALLINT NOT NULL,
	sezione NVARCHAR(1) NOT NULL,
	note NVARCHAR(100)
);

CREATE TABLE student(
	id INT NOT NULL,
	nome NVARCHAR (30) NOT NULL,
	cognome NVARCHAR (30) NOT NULL,
	classe SMALLINT NOT NULL,
	sezione NVARCHAR(1) NOT NULL,
);

INSERT INTO student(id, nome, cognome, classe, sezione)
SELECT DISTINCT id, nome, cognome, classe, sezione 
FROM taccuino_tb;
