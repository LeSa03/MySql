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

/* -------------------------------------------------------------------------------------------------- */
/* ZADATAK 2 || 17/1 prezentacija slajd */
/* za ovaj zadatak, nova sema, tabele ali bez korisnika i privilegija...*/
/* -------------------------------------------------------------------------------------------------- */
DROP SCHEMA nekretnine;
CREATE SCHEMA IF NOT EXISTS nekretnine;
USE nekretnine;

CREATE TABLE nekretnina (id INT PRIMARY KEY auto_increment ,
adresa VARCHAR(45) NOT NULL,
datum_izgradnje DATETIME NOT NULL,
ime_prezime VARCHAR(45) NOT NULL);

INSERT INTO nekretnina VALUES('1','vuka karadzica 12', '2009-12-23 12:00', 'Zdravko Palikuca'),
('2','vuka karadzica 13', '2010-12-23 12:00', 'Colic Zfarko'),
('3','vuka karadzica 14', '2011-12-23 12:00', 'Boris Boris');

CREATE TABLE oglas (id INT PRIMARY KEY auto_increment,
id_nekretnine INT unique NOT NULL,
cena FLOAT,
datum_postavkeoglasa DATETIME NOT NULL,
datum_istekaoglasa DATETIME,
/*CONSTRAINT chk_cena CHECK (cena>50),*//*jako retko se koristi...*/
CONSTRAINT fk_oglas_id FOREIGN KEY (id_nekretnine) REFERENCES nekretnina(id));
/* CONSTRAINT fk_oglas_id FOREIGN KEY (id_nekretnine) REFERENCES nekretnina(id) ---
 ---> ogranicenje da kada DODAJEM NOVI OGLAS MORA PRVO DA POSTOJI TAj id_nekretnine
 u tabeli nekretnina kao id te nekretnine */

INSERT INTO oglas VALUES('10','10','22.000','2009-12-23 13:00','2010-2-22'),
('11','11','55.000','2009-3-23 09:00','2009-6-23'),
('12','12','102.000','2011-12-23 11:00','2012-2-25');

CREATE TABLE zaposleni (ime VARCHAR(35) NOT NULL,
prezime VARCHAR(35) PRIMARY KEY NOT NULL,
grad VARCHAR(35) NOT NULL,
plata FLOAT NOT NULL);

INSERT INTO zaposleni VALUES ('Zikica','Boogie','BeGe','80.000'),
('Laza','Lazarevic','Novi Sad','70.000'),
('Komsija','Bre','Nis','110.000');

/* UPITI */
DELETE FROM nekretnina WHERE year(datum_izgradnje)<1999;

SELECT ime_prezime FROM nekretnina WHERE year(datum_izgradnje)>2005;

SELECT ime_prezime FROM nekretnina WHERE adresa LIKE '%13%';
/* LIKE - lici kao... napisana vrednost, '%beograd%' - znak posto(%), oznacava da nije bitno
sta se nalazi pre ove vreednosti i sta je posle ove vrednosti... */ 

SELECT * FROM oglas WHERE cena<200000;

SELECT * FROM oglas WHERE cena>50 AND datum_postavkeoglasa > '2020-12-12';

SELECT ime, prezime FROM zaposleni ORDER BY plata DESC LIMIT 3;
/* ORDER BY - sortiraj po
   DESC - descending ili ascending
   LIMIT 3 - na 3 rezultata limitiramo, jerr nam treba 3 najvece plate...*/ 

SELECT AVG(plata) FROM zaposleni; /* vrati prosecnu platu iz tabele zaposleni*/

SELECT avg(plata) FROM zaposleni GROUP BY grad;/* vraca prosecnu platu od zaposlenih,
 sortirano po gradovima */

SELECT AVG(cena) AS prosek FROM oglas; /* AS nesto - koristi se da bi naziv kolone umesto
avg(cena) bio to nesto sto smo upisali iza AS */

SELECT SUM(cena) AS suma FROM oglas WHERE year(datum_postavkeoglasa)>2010;

SELECT COUNT(prezime) FROM zaposleni WHERE grad='Novi Sad';

SELECT max(cena) FROM oglas;

SELECT COUNT(id) AS broj_nekretnina FROM nekretnina;

SELECT adresa, count(id) FROM nekretnina group by adresa;/* grupise broj nekretnina po adresama... */

SELECT adresa, count(id) AS broj FROM nekretnina group by adresa HAVING broj=1;
/* selektuje adrese i ispisuje adrese na kojima je broj nekretnina jednak sa 1 */

/* FOREIGN KEY - foreign key u jednoj tabeli predstavlja PRIMARY KEY u drugoj tabeli */
/* RELACIJE - veze izmedju tabela, realizuju se preko stranih kljuceva
Prema TIPU relacije mogu biti: identifikujuce i neidentifikujuce 

Prema kardinalitetu, veze mogu biti: 1:1 - jedan na jedan
									 1:N - jedan na vise
									 N:M - vise na vise*/














