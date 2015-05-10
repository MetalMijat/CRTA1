DROP DATABASE IF EXISTS crta;
CREATE DATABASE IF NOT EXISTS crta;
USE crta;
DROP TABLE IF EXISTS Poslanik;
DROP TABLE IF EXISTS Stranka;
DROP TABLE IF EXISTS PromenaStranke;
DROP TABLE IF EXISTS PoslanickiKlub;
DROP TABLE IF EXISTS PromenaPoslanickogKluba;
DROP TABLE IF EXISTS Mesto;
DROP TABLE IF EXISTS Funkcija;
DROP TABLE IF EXISTS Ustanova;
DROP TABLE IF EXISTS IzvorPrihoda;
DROP TABLE IF EXISTS NepokretnaImovina;
DROP TABLE IF EXISTS PromenaNepokretneImovine;
DROP TABLE IF EXISTS Opozicija;
DROP TABLE IF EXISTS PromenaOpozicije;
DROP TABLE IF EXISTS Depozit;
DROP TABLE IF EXISTS PromenaDepozita;
DROP TABLE IF EXISTS PrevoznoSredstvo;
DROP TABLE IF EXISTS PromPrevSredstva;
DROP TABLE IF EXISTS DodeljenStan;
DROP TABLE IF EXISTS PromDodStana;
CREATE TABLE IF NOT EXISTS Poslanik(
	PoslanikID	INT(20),
	IzvorPodataka VARCHAR(20),
	Drzava VARCHAR(20),
	Ime VARCHAR(20),
	Prezime VARCHAR(70),
	Pol TINYINT(1), 
	StrankaID INT(20),
	PoslKlubID INT(20),
	MestoPoslID INT(20),
	OpozicijID INT(20),
	Slika LONGBLOB,
	PRIMARY KEY(PoslanikID)
);
CREATE TABLE IF NOT EXISTS Stranka(
	StrankaID INT(20),
	Naziv VARCHAR(40),
	DatumOsnivanja DATE,
	PRIMARY KEY(StrankaID)
);
CREATE TABLE IF NOT EXISTS PromenaStranke(
	PoslanikID INT(20),
	StrankaID INT(20),
	DatumOD DATE,
	DatumDO DATE,
	PromenaStrankeID INT(20),
	PRIMARY KEY(PromenaStrankeID)
);
CREATE TABLE IF NOT EXISTS PoslanickiKlub(
	PoslKlubID INT(20),
	Naziv VARCHAR(40),
	StrankaID INT(20),
	Saziv VARCHAR(40),
	PRIMARY KEY(PoslKlubID)
);
CREATE TABLE IF NOT EXISTS PromenaPoslanickogKluba(
	PoslanikID INT(20),
	PoslKlubID INT(20),
	DatumOD DATE,
	DatumDO DATE,
	PromKlubaID INT(20),
	PRIMARY KEY(PromKlubaID)
);
CREATE TABLE IF NOT EXISTS Mesto(
	MestoID INT(20),
	Naziv VARCHAR(40),
	PRIMARY KEY(MestoID)
);
CREATE TABLE IF NOT EXISTS Funkcija(
	FunkcijaID INT(20),
	Naziv VARCHAR(40),
	UstanovaID INT(20),
	Prihodi FLOAT(15),
	VremeOD DATE,
	VremeDO DATE,
	IntervalF VARCHAR(40),
	PoslanikID INT(20),
	Valuta VARCHAR(40),
	IzvorPrihodaID INT(20),
	PRIMARY KEY(FunkcijaID)
);
CREATE TABLE IF NOT EXISTS Ustanova(
	UstanovaID INT(20),
	Naziv VARCHAR(40),
	PRIMARY KEY(UstanovaID)
);
CREATE TABLE IF NOT EXISTS IzvorPrihoda(
	IzvorPrihodaID INT(20),
	Naziv VARCHAR(40),
	PRIMARY KEY(IzvorPrihodaID)
);
CREATE TABLE IF NOT EXISTS NepokretnaImovina(
	NepokretnaImovinaID INT(20),
	Tip VARCHAR(40),
	Stuktura VARCHAR(40),
	Povrsina FLOAT(10),
	JedinicaMerePovrsine VARCHAR(40),
	VlasnickiUdeo VARCHAR(40),
	OsnovSticanja VARCHAR(40),
	PoslanikID INT(20),
	PromenaNIID INT(20),
	PRIMARY KEY(NepokretnaImovinaID)
);
CREATE TABLE IF NOT EXISTS PromenaNepokretneImovine(
	PromenaNIID INT(20),
	PoslanikID INT(20),
	DatumOD DATE,
	DatumDO DATE,
	PRIMARY KEY(PromenaNIID)
);
CREATE TABLE IF NOT EXISTS Opozicija(
	OpozicijaID INT(20),
	Opozicija TINYINT(1),
	PRIMARY KEY(OpozicijaID)
);
CREATE TABLE IF NOT EXISTS PromenaOpozicije(
	OpozicijaID INT(20),
	PoslanikID INT(20),
	DatumOD DATE,
	DatumDO DATE,
	PromOpozicijaID INT(20),
	PRIMARY KEY(PromOpozicijaID)
);
CREATE TABLE IF NOT EXISTS Depozit(
	DepozitID INT(20),
	PromenaDepozitaID INT(20),
	Ima TINYINT(1),
	PoslanikID INT(20),
	PRIMARY KEY(DepozitID)
);
CREATE TABLE IF NOT EXISTS PromenaDepozita(
	PromenaDepozitaID INT(20),
	PoslanikID INT(20),
	DatumOD DATE,
	DatumDO DATE,
	PRIMARY KEY(PromenaDepozitaID)
);
CREATE TABLE IF NOT EXISTS PrevoznoSredstvo(
	PrevoznoSredstvoID INT(20),
	Tip VARCHAR(40),
	GodinaProizvodnje INT(10), 
	OsnovSticanja VARCHAR(40),
	PoslanikID INT(20),
	PromenaPSID INT(20),
	PRIMARY KEY(PrevoznoSredstvoID)
);
CREATE TABLE IF NOT EXISTS PromPrevSredstva(
	PromenaPSID INT(20),
	PoslanikID INT(20),
	DatumOD DATE,
	DatumDO DATE,
	PRIMARY KEY(PromenaPSID)
);
CREATE TABLE IF NOT EXISTS DodeljenStan(
	PravoKoriscenaStanaID INT(20),
	MestoID INT(20),
	Struktura VARCHAR(40),
	Povrsina FLOAT(10),
	OsnovDodele VARCHAR(40),
	PromenaPravaKorID INT(20),
	PoslanikID INT(20),
	PRIMARY KEY(PravoKoriscenaStanaID)
);
CREATE TABLE IF NOT EXISTS PromDodStana(
	PromenePravaKorID INT(20),
	PoslanikID INT(20),
	DatumOd DATE,
	DatumDO DATE,
	PRIMARY KEY(PromenePravaKorID)
);

DROP PROCEDURE IF EXISTS crta_insert_stranka;
CREATE PROCEDURE crta_insert_stranka
(IN id INT(20), IN naziv VARCHAR(40), IN datum DATE) 
INSERT INTO Stranka(StrankaID, Naziv, DatumOsnivanja) VALUES(id, naziv, datum);

DROP PROCEDURE IF EXISTS crta_insert_poslanickiklub;
CREATE PROCEDURE crta_insert_poslanickiklub
(IN id INT(20), IN naziv VARCHAR(40), IN StrankaID INT(20), IN Saziv VARCHAR(40))
INSERT INTO PoslanickiKlub(PoslKlubID, Naziv, StrankaID, Saziv) VALUES(id, naziv, StrankaID, Saziv);

DROP PROCEDURE IF EXISTS crta_insert_mesta;
CREATE PROCEDURE crta_insert_mesta
(IN id INT(20), IN naziv VARCHAR(40))
INSERT INTO Mesto(MestoID, Naziv) VALUES(id, naziv);

DROP PROCEDURE IF EXISTS crta_insert_ustanova;
CREATE PROCEDURE crta_insert_ustanova
(IN id INT(20), IN naziv VARCHAR(40))
INSERT INTO Mesto(UstanovaID, Naziv) VALUES(id, naziv);

DROP PROCEDURE IF EXISTS crta_insert_izvorprihoda;
CREATE PROCEDURE crta_insert_izvorprihoda
(IN id INT(20), IN naziv VARCHAR(40))
INSERT INTO Mesto(IzvorPrihodaID, Naziv) VALUES(id, naziv);

DROP PROCEDURE IF EXISTS crta_insert_poslanik;
CREATE PROCEDURE crta_insert_poslanik
(IN id INT(20), IN izvor VARCHAR(40),IN drzava VARCHAR(40),IN ime VARCHAR(20), IN prezime VARCHAR(40), IN pol TINYINT(1), IN strankaid INT(10), IN poslklubid INT(10), IN mestoid INT(10), IN opozid INT(10), IN slika BLOB)
INSERT INTO Poslanik(PoslanikID, IzvorPodataka, Drzava, Ime, Prezime, Pol, StrankaID, PoslKlubID, MestoPoslID, OpozicijaID, Slika) 
VALUES(id, izvor, drzava, ime, prezime, pol, strankaid, poslklubid, mestoid, opozid, slika);

DROP PROCEDURE IF EXISTS crta_insert_funkcija;
CREATE PROCEDURE crta_insert_funkcija
(IN id INT(20), IN naziv VARCHAR(40), IN ustanovaID VARCHAR(40), IN prihodi FLOAT(20), IN vrmeod DATE, IN vremedo DATE, IN intervalf VARCHAR(40), IN poslanikid INT(10), IN valuta VARCHAR(20), IN izvorprihodaid INT(10) )
INSERT INTO Funkcija(FunkcijaID, Naziv, UstanovaID, Prihodi, VremeOD, VremeDO, IntervalF, PoslanikID, Valuta, IzvorPrihodaID) 
VALUES(id, naziv, ustanovaID, prihodi, vrmeod, vremedo, intervalf, poslanikid, valuta, izvorprihodaid);

DROP PROCEDURE IF EXISTS crta_insert_nepokretnaimovina;
CREATE PROCEDURE crta_insert_nepokretnaimovina
(IN id INT(10), IN tip VARCHAR(40), IN struktura VARCHAR(40), IN povrsina FLOAT(20), IN jedinica VARCHAR(40), IN udeo VARCHAR(40), IN sticanje VARCHAR(40), IN poslanikID INT(10), IN promenaniID INT(10))
INSERT INTO NepokretnaImovina(NepokretnaImovinaID, Tip, Struktura, Povrsina, JedinicaMerePovrsine, VlasnickuUdeo, OsnovSticanja, PoslanikID, PromenaNIID)
VALUES(id, tip, struktura, povrsina, jedinica, udeo, sticanje, poslanikID, promenaniID);

DROP PROCEDURE IF EXISTS crta_insert_opozicija;
CREATE PROCEDURE crta_insert_opozicija
(IN id INT(10), IN opozicija TINYINT(1))
INSERT INTO Opozicija(OpozicijaID, Opozicija) VALUES(id, opozicija);

DROP PROCEDURE IF EXISTS crta_insert_depozit;
CREATE PROCEDURE crta_insert_depozit
(IN id INT(10), IN promenadepozitaID INT(10), IN ima TINYINT(1), IN poslanikID INT(10))
INSERT INTO Depozit(DepozitID, PromenaDepozitaID, Ima, PoslanikID) VALUES(id, promenadepozitaID, ima, poslanikID);

DROP PROCEDURE IF EXISTS crta_insert_prevoznosredstvo;
CREATE PROCEDURE crta_insert_prevoznosredstvo
(IN id INT(10), IN tip VARCHAR(40), IN godiste INT(10), IN osnovsticanja VARCHAR(40), IN poslanikID INT(10), IN promenapsID INT(10))
INSERT INTO PrevoznoSredstvo(PrevoznoSredstvoID, Tip, GodinaProizvodnje, OsnovSticanja, PoslanikID, PromenaPSID) 
VALUES(id, tip, godiste, osnovsticanja, poslanikID, promenapsID);

DROP PROCEDURE IF EXISTS crta_insert_dodeljenstan;
CREATE PROCEDURE crta_insert_dodeljenstan
(IN id INT(10), IN mestoID INT(10), IN struktura VARCHAR(40), IN povrsina FLOAT(20), IN osnovdodele VARCHAR(40), IN promenapkID INT(10), IN poslanikID INT(10))
INSERT INTO DodeljenStan(PravoKoriscenaStanaID, MestoID, Struktura, Povrsina, OsnovDodele, PromenaPravKorID, PoslanikID) 
VALUES(id, mestoID, struktura, povrsina, osnovdodele, promenapkID, poslanikID);

DROP PROCEDURE IF EXISTS crta_insert_promdodstana;
CREATE PROCEDURE crta_insert_promdodstana
(IN id INT(10), IN posalnikID INT(10), IN datumod DATE, IN datumdo DATE)
INSERT INTO PromDodStana(PromenaPravaKorID, PoslanikID, DatumOD, DatumDO) 
VALUES(id, posalnikID, datumod, datumdo);

DROP PROCEDURE IF EXISTS crta_insert_promprevsredstva;
CREATE PROCEDURE crta_insert_promprevsredstva
(IN id INT(10), IN posalnikID INT(10), IN datumod DATE, IN datumdo DATE)
INSERT INTO PromPrevSredstva(PromenaPSID, PoslanikID, DatumOD, DatumDO) VALUES(id, posalnikID, datumod, datumdo);

DROP PROCEDURE IF EXISTS crta_insert_promenadepozita;
CREATE PROCEDURE crta_insert_promenadepozita
(IN id INT(10), IN posalnikID INT(10), IN datumod DATE, IN datumdo DATE)
INSERT INTO PromenaDepozita(PromenaDepozitaID, PoslanikID, DatumOD, DatumDO) VALUES(id, posalnikID, datumod, datumdo);

DROP PROCEDURE IF EXISTS crta_insert_promenaopozicije;
CREATE PROCEDURE crta_insert_promenaopozicije
(IN opozicijaID INT(10), IN posalnikID INT(10), IN datumod DATE, IN datumdo DATE, IN id INT(10))
INSERT INTO PromenaOpozicije(OpozicijaID, PoslanikID, DatumOD, DatumDO, PromOpozicijaID) 
VALUES(opozicijaID, posalnikID, datumod, datumdo, id);

DROP PROCEDURE IF EXISTS crta_insert_promenanepokretneimovine;
CREATE PROCEDURE crta_insert_promenanepokretneimovine
(IN id INT(10), IN posalnikID INT(10), IN datumod DATE, IN datumdo DATE)
INSERT INTO PromenaNepokretneImovine(PromenaNIID, PoslanikID, DatumOD, DatumDO) VALUES(id, posalnikID, datumod, datumdo);

DROP PROCEDURE IF EXISTS crta_insert_promenastranke;
CREATE PROCEDURE crta_insert_promenastranke
(IN poslanikID INT(10), IN strankaID INT(10), IN datumod DATE, IN datumdo DATE, IN id INT(10))
INSERT INTO PromenaStranke(PoslanikID, StrankaID, DatumOD, DatumDO, PromenaStrankeID) 
VALUES(poslanikID, strankaID, datumod, datumdo, id);

DROP PROCEDURE IF EXISTS crta_insert_promenaposlanickogkluba;
CREATE PROCEDURE crta_insert_promenaposlanickogkluba
(IN poslanikID INT(10), IN sposlklubID INT(10), IN datumod DATE, IN datumdo DATE, IN id INT(10))
INSERT INTO PromenaPoslanickogKluba(PoslanikID, PoslKlubID, DatumOD, DatumDO, PromenaStrankeID) 
VALUES(poslanikID, sposlklubID, datumod, datumdo, id);
