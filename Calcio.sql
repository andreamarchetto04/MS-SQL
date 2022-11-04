CREATE DATABASE campionato;
USE campionato;

CREATE TABLE person(
	id INT IDENTITY(1, 1) PRIMARY KEY,
	name NVARCHAR(40) NOT NULL,
	surname NVARCHAR(40) NOT NULL,
	id_role INT FOREIGN KEY REFERENCES p_role(id),
	id_society INT FOREIGN KEY REFERENCES society(id),
)

CREATE TABLE society(
	id INT IDENTITY(1, 1) PRIMARY KEY,
	description NVARCHAR (50) NOT NULL,
)

CREATE TABLE p_role(
	id INT IDENTITY(1, 1) PRIMARY KEY,
	description NVARCHAR (50) NOT NULL,
)

