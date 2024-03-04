CREATE SCHEMA IF NOT EXISTS drugiprimer2024;
USE drugiprimer2024;

CREATE TABLE IF NOT EXISTS student(indeks VARCHAR(20) PRIMARY KEY,
ime VARCHAR(45),
prezime VARCHAR(45));

DROP TABLE student;

INSERT INTO student VALUES('123', 'Marko', 'Marek');
INSERT INTO student(indeks, prezime) VALUES ('456', 'Petrovic');

SELECT ime, prezime, indeks FROM student;