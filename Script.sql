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
SELECT DISTINCT id, nome, cognome, classe, sezione /* distinct mi prende le cose una volta*/
FROM taccuino_tb;

CREATE TABLE subject(
	id INT IDENTITY(1, 1) PRIMARY KEY,
	description NVARCHAR (20) NOT NULL,
);

INSERT INTO subject(description)
SELECT DISTINCT materia
FROM taccuino_tb;

CREATE TABLE teacher(
	id INT IDENTITY(1, 1) PRIMARY KEY,
	nome NVARCHAR (30) NOT NULL,
	cognome NVARCHAR (30) NOT NULL,
	materia NVARCHAR (15) NOT NULL,
);

INSERT INTO teacher(nome, cognome, materia)
SELECT DISTINCT nome_docente, cognome_docente, materia
FROM taccuino_tb;

CREATE TABLE valutation(
	id INT IDENTITY(1, 1) PRIMARY KEY,
	materia NVARCHAR (15) NOT NULL,
	voto DECIMAL NOT NULL,
	note NVARCHAR (100) NOT NULL,
	data_voto DATE,
	id_studente INT NOT NULL,
);

INSERT INTO valutation(materia, voto, note, data_voto, id_studente)
SELECT DISTINCT materia, voto, note, data_voto, id
FROM taccuino_tb;


