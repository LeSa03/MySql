CREATE SCHEMA IF NOT EXISTS drugiprimer2024;
USE drugiprimer2024;

CREATE TABLE IF NOT EXISTS student(indeks VARCHAR(20) PRIMARY KEY,
ime VARCHAR(45),
prezime VARCHAR(45));

DROP TABLE student;

INSERT INTO student VALUES('123', 'Marko', 'Marek');
INSERT INTO student(indeks, prezime) VALUES ('456', 'Petrovic');

INSERT INTO student VALUES ('124', 'Darko', 'Bozicic','12-12-2003'),
 ('125', 'zoran', 'Bozicic', '13-11-2003'),
 ('126', 'borko', 'kindzer', '14-10-2003');

SELECT ime, prezime, indeks FROM student;/* selektuej sve studente iz tabele student
 i ispisuje ih sa izabranim parametrima ( ime, prezime, indeks )*/

SHOW TABLES;
DESCRIBE student;

ALTER TABLE student ADD COLUMN datum_rodjenja DATE;
ALTER TABLE student DROP COLUMN datum_rodjenja;

SELECT * FROM student; /* selektuej sve iz tabele student*/
SELECT * FROM student WHERE indeks='123';

UPDATE student SET prezime='Marko' WHERE ime='Marko';/* apdejtuje prezime u Marko svima 
koji imaju ime Marko u tabeli student */
UPDATE student SET ime='Zorz' WHERE prezime='Marko';

/* -------------------------------------------------------------------------------------------------- */
/* ZADATAK 1 || 16/1 prezentacija slajd */
/* za ovaj zadatak, nova sema, tabele i sve ostalo*/
/* -------------------------------------------------------------------------------------------------- */

CREATE SCHEMA IF NOT EXISTS zadatak1;
USE zadatak1;

CREATE TABLE IF NOT EXISTS studenti(indeks VARCHAR(10) PRIMARY KEY NOT NULL
, ime VARCHAR(35) NOT NULL
,prezime VARCHAR(35) NOT NULL
,prosecna_ocena INT
, datum DATE NOT NULL);

CREATE TABLE IF NOT EXISTS nastavnici(sifra_zaposlenog VARCHAR(10) PRIMARY KEY NOT NULL
, ime VARCHAR(35) NOT NULL
, prezime VARCHAR(35) NOT NULL
,AorP BOOLEAN NOT NULL /*ako je true onda je asistent, ako je false onda je profesor*/
,datum DATE NOT NULL);

CREATE TABLE IF NOT EXISTS predmeti(sifra_predmeta VARCHAR(10) PRIMARY KEY NOT NULL
, naziv VARCHAR(35) NOT NULL
, broj_casova_nedeljno INT NOT NULL
,broj_espb INT NOT NULL);

INSERT INTO studenti VALUES ('1', 'Jedan', 'Jedini', '7', '2003-12-23');
INSERT INTO nastavnici VALUES ('10', 'pjedan', 'predavac', true, '2003-12-23');
INSERT INTO predmeti VALUES ('100', 'predmetjedan', '3', '10');

INSERT INTO nastavnici VALUES ('11', 'pdva', 'predavacc', true, '2003-11-21'),
('12', 'ptri', 'predavaacc', false, '2003-11-21'),
('13', 'pcetri', 'predavvacc', false, '2003-09-21'),
('14', 'pdva', 'prredavacc', true, '2003-08-21');

INSERT INTO studenti VALUES('2', 'Dva', 'Drugi', '8', '2004-12-23'),
('3', 'tri', 'tre', '9', '2005-12-23'),
('4', 'cetr', 'Drug', '10', '2004-12-23'),
('5', 'pet', 'Dru', '7', '2006-12-23');

INSERT INTO predmeti VALUES ('101', 'predmetdva', '2', '9'),
('102', 'predmettri', '5', '8'),
('103', 'predmetcetri', '1', '7'),
('104', 'predmetpet', '3', '6');

UPDATE nastavnici SET ime='Marko' WHERE AorP= true;

DELETE FROM studenti WHERE prosecna_ocena<= '7';

SELECT ime, prezime FROM studenti WHERE prosecna_ocena > 8.0;

SELECT sifra_zaposlenog FROM nastavnici WHERE AorP= false AND year(datum)=2003;
/* year(datum)=2003 || funkcija za GODINE, godinu u datumu(DATE) kao vrsti inputa */






