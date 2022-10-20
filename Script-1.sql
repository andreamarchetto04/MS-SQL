CREATE DATABASE registro_elettronico5F;
USE registro_elettronico5F; 

CREATE TABLE studente(
id_studente int identity(1,1) PRIMARY KEY,
nome nvarchar(30) NOT NULL, 
cognome nvarchar(30) NOT NULL
);

CREATE TABLE docente(
id_docente int identity(1,1) PRIMARY KEY, 
nome nvarchar(30) NOT NULL, 
cognome nvarchar(30) NOT NULL
);

CREATE TABLE materia(
id_materia int identity(1,1) PRIMARY KEY,
descrizione nvarchar(40) NOT NULL
);

CREATE TABLE classe(
id_classe int identity(1,1) PRIMARY KEY,
anno int NOT NULL,
sezione nvarchar(1) NOT NULL,
);


CREATE TABLE studenti_della_classe(
id_classe int FOREIGN KEY REFERENCES classe(id_classe),
id_studente int FOREIGN KEY REFERENCES studente(id_studente), 
CONSTRAINT pk_studenti_classe PRIMARY KEY(id_classe, id_studente)
/*Creo la chiave della tabella che è l'unione tra id_classe e studente*/
); 

CREATE TABLE abbinamento_classe_docente_materia(
id_classe int FOREIGN KEY REFERENCES classe(id_classe),
id_docente int FOREIGN KEY REFERENCES docente(id_docente),
id_materia int FOREIGN KEY REFERENCES materia(id_materia),
CONSTRAINT pk_classe_docente_materia PRIMARY KEY (id_classe, id_docente, id_materia)
);

SELECT d.nome, d.cognome, m.descrizione, c.anno, c.sezione
FROM abbinamento_classe_docente_materia acdm 
LEFT JOIN docente d ON acdm.id_docente = d.id_docente		/*vista dei docenti con la materia e la classe*/
LEFT JOIN materia m ON acdm.id_materia = m.id_materia
LEFT JOIN classe c ON acdm.id_classe = c.id_classe;

SELECT s.nome AS "Nome studente", s.cognome AS "Cognome studente", c.anno AS "Classe", c.sezione AS "Sezione"
FROM studenti_della_classe sdc 
LEFT JOIN studente s ON sdc.id_studente = s.id_studente		/*vista degli studenti e della classe*/
LEFT JOIN classe c ON sdc.id_classe = c.id_classe;