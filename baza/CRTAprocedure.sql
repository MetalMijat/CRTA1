--------------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS crta_insert_stranka;
CREATE PROCEDURE crta_insert_stranka
(IN id INT(20), IN naziv VARCHAR(40), IN datum DATE) 
INSERT INTO Stranka(StrankaID, Naziv, DatumOsnivanja) VALUES(id, naziv, datum);
--------------------------------------------------------------------------------
	--------------------------------------------------------------------------------
	-- Unos podataka Stranka
	SET @p0=''; -- id 
	SET @p1=''; -- naziv
	SET @p2=''; -- datum
	CALL crta_insert_stranka(@p0, @p1, @p2);
	--------------------------------------------------------------------------------
	
------------------------------------------- End 1

--------------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS crta_insert_poslanickiklub;
CREATE PROCEDURE crta_insert_poslanickiklub
(IN id INT(20), IN naziv VARCHAR(40), IN StrankaID INT(20), IN Saziv VARCHAR(40))
INSERT INTO PoslanickiKlub(PoslKlubID, Naziv, StrankaID, Saziv) VALUES(id, naziv, StrankaID, Saziv);
--------------------------------------------------------------------------------
	--------------------------------------------------------------------------------
	-- Unos podataka PoslanickiKlub
	SET @p0=''; -- id 
	SET @p1=''; -- naziv
	SELECT StrankaID INTO @p2 FROM Stranka WHERE Naziv = 'Srpska napredna stranka' LIMIT 1; -- StrankaID
	SET @p3=''; -- Saziv
	CALL crta_insert_poslanickiklub(@p0, @p1, @p2, @p3);
	--------------------------------------------------------------------------------

------------------------------------------- End 2

--------------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS crta_insert_mesta;
CREATE PROCEDURE crta_insert_mesta
(IN id INT(20), IN naziv VARCHAR(40))
INSERT INTO Mesto(MestoID, Naziv) VALUES(id, naziv);
--------------------------------------------------------------------------------
	--------------------------------------------------------------------------------
	-- Unos podataka Mest
	SET @p0=''; -- id 
	SET @p1=''; -- naziv
	CALL crta_insert_stranka(@p0, @p1);
	--------------------------------------------------------------------------------
	
------------------------------------------- End 3

--------------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS crta_insert_ustanova;
CREATE PROCEDURE crta_insert_ustanova
(IN id INT(20), IN naziv VARCHAR(40))
INSERT INTO Mesto(UstanovaID, Naziv) VALUES(id, naziv);
--------------------------------------------------------------------------------
	--------------------------------------------------------------------------------
	-- Unos podataka Ustanova
	SET @p0=''; -- id 
	SET @p1=''; -- naziv
	CALL crta_insert_stranka(@p0, @p1);
	--------------------------------------------------------------------------------
	
------------------------------------------- End 4

--------------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS crta_insert_izvorprihoda;
CREATE PROCEDURE crta_insert_izvorprihoda
(IN id INT(20), IN naziv VARCHAR(40))
INSERT INTO Mesto(IzvorPrihodaID, Naziv) VALUES(id, naziv);
--------------------------------------------------------------------------------
	--------------------------------------------------------------------------------
	-- Unos podataka IzvorPrihoda
	SET @p0=''; -- id 
	SET @p1=''; -- naziv
	CALL crta_insert_stranka(@p0, @p1);
	--------------------------------------------------------------------------------
	
------------------------------------------- End 5

--------------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS crta_insert_poslanik;
CREATE PROCEDURE crta_insert_poslanik
(IN id INT(20), IN izvor VARCHAR(40),IN drzava VARCHAR(40),IN ime VARCHAR(20), IN prezime VARCHAR(40), IN pol TINYINT(1), IN strankaid INT(10), IN poslklubid INT(10), IN mestoid INT(10), IN opozid INT(10), IN slika BLOB)
INSERT INTO Poslanik(PoslanikID, IzvorPodataka, Drzava, Ime, Prezime, Pol, StrankaID, PoslKlubID, MestoPoslID, OpozicijaID, Slika) 
VALUES(id, izvor, drzava, ime, prezime, pol, strankaid, poslklubid, mestoid, opozid, slika);
--------------------------------------------------------------------------------
	--------------------------------------------------------------------------------
	-- Unos podataka IzvorPrihoda
	SET @p0=''; -- id 
	SET @p1=''; -- izvor
	SET @p2=''; -- drzava
	SET @p3=''; -- ime
	SET @p4=''; -- prezime
	SET @p5=''; -- pol
	SELECT StrankaID INTO @p6 FROM Stranka WHERE Naziv = '' LIMIT 1; -- StrankaID
	SELECT PoslKlubID INTO @p7 FROM PoslanickiKlub WHERE Naziv ='' LIMIT 1; -- PoslKlubID
	SELECT MestoID INTO @p8 FROM Mesto WHERE Naziv ='' LIMIT 1; -- MestoPoslID
	SELECT OpozicijaID INTO @p9 FROM Opozicija WHERE OpozicijaID = '' LIMIT 1; -- OpozicijaID
	SET @p10=''; -- Slika
	CALL crta_insert_stranka(@p0, @p1, @p2, @p3, @p4, @p5, @p6, @p7, @p8, @p9, @p10);
	--------------------------------------------------------------------------------

------------------------------------------- End 6

--------------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS crta_insert_funkcija;
CREATE PROCEDURE crta_insert_funkcija
(IN id INT(20), IN naziv VARCHAR(40), IN ustanovaID VARCHAR(40), IN prihodi FLOAT(20), IN vrmeod DATE, IN vremedo DATE, IN intervalf VARCHAR(40), IN poslanikid INT(10), IN valuta VARCHAR(20), IN izvorprihodaid INT(10) )
INSERT INTO Funkcija(FunkcijaID, Naziv, UstanovaID, Prihodi, VremeOD, VremeDO, IntervalF, PoslanikID, Valuta, IzvorPrihodaID) 
VALUES(id, naziv, ustanovaID, prihodi, vrmeod, vremedo, intervalf, poslanikid, valuta, izvorprihodaid);
--------------------------------------------------------------------------------
	--------------------------------------------------------------------------------
	-- Unos podataka Funkcija
	SET @p0=''; -- id 
	SET @p1=''; -- naziv
	SET @p6=''; -- intervalf 
	SET @p3=''; -- prihodi
	SET @p4=''; -- vremeod
	SET @p5=''; -- vremedo
	SELECT PoslanikID INTO @p7 FROM Poslanik WHERE PoslanikID = '' LIMIT 1; -- PoslanikID
	SELECT UstanovaID INTO @p2 FROM Ustanova WHERE Naziv ='' LIMIT 1; -- ustanova id
	SELECT IzvorPrihodaID INTO @p9 FROM IzvorPrihoda WHERE Naziv ='' LIMIT 1; -- izvorprihodaid
	SET @p8=''; -- valuta
	CALL crta_insert_stranka(@p0, @p1, @p2, @p3, @p4, @p5, @p6, @p7, @p8, @p9);
	--------------------------------------------------------------------------------

------------------------------------------- End 7

--------------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS crta_insert_nepokretnaimovina;
CREATE PROCEDURE crta_insert_nepokretnaimovina
(IN id INT(10), IN tip VARCHAR(40), IN struktura VARCHAR(40), IN povrsina FLOAT(20), IN jedinica VARCHAR(40), IN udeo VARCHAR(40), IN sticanje VARCHAR(40), IN poslanikID INT(10), IN promenaniID INT(10))
INSERT INTO NepokretnaImovina(NepokretnaImovinaID, Tip, Struktura, Povrsina, JedinicaMerePovrsine, VlasnickuUdeo, OsnovSticanja, PoslanikID, PromenaNIID)
VALUES(id, tip, struktura, povrsina, jedinica, udeo, sticanje, poslanikID, promenaniID);
--------------------------------------------------------------------------------
	--------------------------------------------------------------------------------
	-- Unos podataka Funkcija
	SET @p0=''; -- id 
	SET @p1=''; -- tip
	SET @p2=''; -- struktura 
	SET @p3=''; -- povrsina
	SET @p4=''; -- jedinica
	SET @p5=''; -- udeo
	SET @p6=''; -- sticanje
	SELECT PoslanikID INTO @p7 FROM Poslanik WHERE PoslanikID = '' LIMIT 1; -- PoslanikID
	SELECT PromenaNIID INTO @p8 FROM PromenaNepokretneImovine WHERE NazPromenaNIIDiv ='' LIMIT 1; -- promenaNIID, treba ispraviti uslov da uzima poslednji interval
	CALL crta_insert_stranka(@p0, @p1, @p2, @p3, @p4, @p5, @p6, @p7, @p8);

------------------------------------------- End 8

--------------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS crta_insert_opozicija;
CREATE PROCEDURE crta_insert_opozicija
(IN id INT(10), IN opozicija TINYINT(1))
INSERT INTO Opozicija(OpozicijaID, Opozicija) VALUES(id, opozicija);
--------------------------------------------------------------------------------
	--------------------------------------------------------------------------------
	-- Unos podataka Opozicija
	SET @p0=''; -- id 
	SET @p1=''; -- OPOZICIJA
	CALL crta_insert_opozicija(@p0, @p1);
	--------------------------------------------------------------------------------

------------------------------------------- End 9

--------------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS crta_insert_depozit;
CREATE PROCEDURE crta_insert_depozit
(id, promenadepozitaID, ima, poslanikID)
INSERT INTO Depozit(DepozitID, PromenaDepozitaID, Ima, PoslanikID) VALUES(id, promenadepozitaID, ima, poslanikID);
--------------------------------------------------------------------------------
	--------------------------------------------------------------------------------
	-- Unos podataka Depozit
	SET @p0=''; -- id 
	SELECT PromenaDepozitaID INTO @p1 FROM PromenaDepozita WHERE PromenaDepozitaID = '' LIMIT 1; -- promenaDepozitaID, prepraviti da uslov bude poslednji interval za datog poslanika
	SET @p2=''; -- ima
	SELECT PoslanikID INTO @p3 FROM Poslanik WHERE PoslanikID = '' LIMIT 1; -- poslanikID
	CALL crta_insert_depozit(@p0, @p1, @p2, @p3);
	--------------------------------------------------------------------------------

------------------------------------------- End 10

--------------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS crta_insert_prevoznosredstvo;
CREATE PROCEDURE crta_insert_prevoznosredstvo
(IN id INT(10), IN tip VARCHAR(40), IN godiste INT(10), IN osnovsticanja VARCHAR(40), IN poslanikID INT(10), IN promenapsID INT(10))
INSERT INTO PrevoznoSredstvo(PrevoznoSredstvoID, Tip, GodinaProizvodnje, OsnovSticanja, PoslanikID, PromenaPSID) 
VALUES(id, tip, godiste, osnovsticanja, poslanikID, promenapsID);
--------------------------------------------------------------------------------
	--------------------------------------------------------------------------------
	-- Unos podataka Prevozno Sredstvo
	SET @p0=''; -- id 
	SET @p1=''; -- tip
	SET @p2=''; -- godiste
	SET @p3=''; -- osnovsticanja
	SELECT PoslanikID INTO @p4 FROM Poslanik WHERE PoslanikID = '' LIMIT 1; -- poslanikID
	SELECT PromenaPSID INTO @p5 FROM PromPrevSredstva WHERE PromenaPSID = '' LIMIT 1; -- PromenaPSID, prepraviti da uslov bude poslednji interval za datog poslanika
	CALL crta_insert_prevoznosredstvo(@p0, @p1, @p2, @p3, @p4, @p5);
	--------------------------------------------------------------------------------

------------------------------------------- End 11

--------------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS crta_insert_dodeljenstan;
CREATE PROCEDURE crta_insert_dodeljenstan
(IN id INT(10), IN mestoID INT(10), IN struktura VARCHAR(40), IN povrsina FLOAT(20), IN osnovdodele VARCHAR(40), IN promenapkID INT(10), IN poslanikID INT(10))
INSERT INTO DodeljenStan(PravoKoriscenaStanaID, MestoID, Struktura, Povrsina, OsnovDodele, PromenaPravKorID, PoslanikID) 
VALUES(id, mestoID, struktura, povrsina, osnovdodele, promenapkID, poslanikID);
--------------------------------------------------------------------------------
	--------------------------------------------------------------------------------
	-- Unos podataka Dodeljen Stan
	SET @p0=''; -- id 
	SELECT MestoID INTO @p1 FROM Mesto WHERE Naziv ='' LIMIT 1; -- mestoID
	SET @p2=''; -- struktura
	SET @p3=''; -- povrsina
	SET @p4=''; -- osnovdodele
	SELECT PromenaPravaKorID INTO @p5 FROM PromDodStana WHERE PromenaPravaKorID = '' LIMIT 1; -- promenapkID, odraditi uslov sa intervalom
	SELECT PoslanikID INTO @p6 FROM Poslanik WHERE PoslanikID = '' LIMIT 1; -- poslanik ID
	CALL crta_insert_prevoznosredstvo(@p0, @p1, @p2, @p3, @p4, @p5, @p6);
	--------------------------------------------------------------------------------

------------------------------------------- End 12

--------------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS crta_insert_promdodstana;
CREATE PROCEDURE crta_insert_promdodstana
(IN id INT(10), IN posalnikID INT(10), IN datumod DATE, IN datumdo DATE)
INSERT INTO PromDodStana(PromenaPravaKorID, PoslanikID, DatumOD, DatumDO) 
VALUES(id, posalnikID, datumod, datumdo);
--------------------------------------------------------------------------------
	--------------------------------------------------------------------------------
	-- Unos podataka promena dodeljenog stana
	SET @p0=''; -- id 
	SELECT PoslanikID INTO @p1 FROM Poslanik WHERE PoslanikID = '' LIMIT 1; -- poslanik ID
	SET @p2=''; -- datumod
	SET @p3=''; -- datumdo
	CALL crta_insert_promdodstana(@p0, @p1, @p2, @p3);
	--------------------------------------------------------------------------------

------------------------------------------- End 13

--------------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS crta_insert_promprevsredstva;
CREATE PROCEDURE crta_insert_promprevsredstva
(IN id INT(10), IN posalnikID INT(10), IN datumod DATE, IN datumdo DATE)
INSERT INTO PromPrevSredstva(PromenaPSID, PoslanikID, DatumOD, DatumDO) VALUES(id, posalnikID, datumod, datumdo);
--------------------------------------------------------------------------------
	--------------------------------------------------------------------------------
	-- Unos podataka promena prevoznog sredstva
	SET @p0=''; -- id 
	SELECT PoslanikID INTO @p1 FROM Poslanik WHERE PoslanikID = '' LIMIT 1; -- poslanik ID
	SET @p2=''; -- datumod
	SET @p3=''; -- datumdo
	CALL crta_insert_promprevsredstva(@p0, @p1, @p2, @p3);
	--------------------------------------------------------------------------------

------------------------------------------- End 14

--------------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS crta_insert_promenadepozita;
CREATE PROCEDURE crta_insert_promenadepozita
(IN id INT(10), IN posalnikID INT(10), IN datumod DATE, IN datumdo DATE)
INSERT INTO PromenaDepozita(PromenaDepozitaID, PoslanikID, DatumOD, DatumDO) VALUES(id, posalnikID, datumod, datumdo);
--------------------------------------------------------------------------------
	--------------------------------------------------------------------------------
	-- Unos podataka promena depozita
	SET @p0=''; -- id 
	SELECT PoslanikID INTO @p1 FROM Poslanik WHERE PoslanikID = '' LIMIT 1; -- poslanik ID
	SET @p2=''; -- datumod
	SET @p3=''; -- datumdo
	CALL crta_insert_promenadepozita(@p0, @p1, @p2, @p3);
	--------------------------------------------------------------------------------

------------------------------------------- End 15

--------------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS crta_insert_promenaopozicije;
CREATE PROCEDURE crta_insert_promenaopozicije
(IN opozicijaID INT(10), IN posalnikID INT(10), IN datumod DATE, IN datumdo DATE, IN id INT(10))
INSERT INTO PromenaOpozicije(OpozicijaID, PoslanikID, DatumOD, DatumDO, PromOpozicijaID) 
VALUES(opozicijaID, posalnikID, datumod, datumdo, id);
--------------------------------------------------------------------------------
	--------------------------------------------------------------------------------
	-- Unos podataka promena depozita
	SELECT OpozicijaID INTO @p0 FROM Opozicija WHERE Opozicija =''; -- opozicijaID 
	SELECT PoslanikID INTO @p1 FROM Poslanik WHERE PoslanikID = '' LIMIT 1; -- poslanik ID
	SET @p2=''; -- datumod
	SET @p3=''; -- datumdo
	SET @p4=''; -- id
	CALL crta_insert_promenaopozicije(@p0, @p1, @p2, @p3);
	--------------------------------------------------------------------------------

------------------------------------------- End 16

--------------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS crta_insert_promenanepokretneimovine;
CREATE PROCEDURE crta_insert_promenanepokretneimovine
(IN id INT(10), IN posalnikID INT(10), IN datumod DATE, IN datumdo DATE)
INSERT INTO PromenaNepokretneImovine(PromenaNIID, PoslanikID, DatumOD, DatumDO) VALUES(id, posalnikID, datumod, datumdo);
--------------------------------------------------------------------------------
	--------------------------------------------------------------------------------
	-- Unos podataka promena nepokretne imovine
	SET @p0=''; -- id 
	SELECT PoslanikID INT @p1 FROM Poslanik WHERE PoslanikID = '' LIMIT 1; -- poslanik ID
	SET @p2=''; -- datumod
	SET @p3=''; -- datumdo
	CALL crta_insert_promenanepokretneimovine(@p0, @p1, @p2, @p3);
	--------------------------------------------------------------------------------

------------------------------------------- End 17

--------------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS crta_insert_promenastranke;
CREATE PROCEDURE crta_insert_promenastranke
(IN poslanikID INT(10), IN strankaID INT(10), IN datumod DATE, IN datumdo DATE, IN id INT(10))
INSERT INTO PromenaStranke(PoslanikID, StrankaID, DatumOD, DatumDO, PromenaStrankeID) 
VALUES(poslanikID, strankaID, datumod, datumdo, id);
--------------------------------------------------------------------------------
	--------------------------------------------------------------------------------
	-- Unos podataka promena nepokretne imovine
	SELECT PoslanikID INT @p0 FROM Poslanik WHERE PoslanikID = '' LIMIT 1; -- poslanik ID
	SELECT StrankaID INT @p1 FROM Stranka WHERE Naziv = '' LIMIT 1; -- stranka ID
	SET @p2=''; -- datumod
	SET @p3=''; -- datumdo
	SET @P4=''; -- id
	CALL crta_insert_promenanepokretneimovine(@p0, @p1, @p2, @p3);
	--------------------------------------------------------------------------------

------------------------------------------- End 18

--------------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS crta_insert_promenaposlanickogkluba;
CREATE PROCEDURE crta_insert_promenaposlanickogkluba
(IN poslanikID INT(10), IN sposlklubID INT(10), IN datumod DATE, IN datumdo DATE, IN id INT(10))
INSERT INTO PromenaPoslanickogKluba(PoslanikID, PoslKlubID, DatumOD, DatumDO, PromenaStrankeID) 
VALUES(poslanikID, sposlklubID, datumod, datumdo, id);
--------------------------------------------------------------------------------
	--------------------------------------------------------------------------------
	-- Unos podataka promena nepokretne imovine
	SELECT PoslanikID INT @p0 FROM Poslanik WHERE PoslanikID = '' LIMIT 1; -- poslanik ID
	SELECT PoslKlubID INT @p1 FROM PoslanickiKlub WHERE Naziv = '' LIMIT 1; -- posl klub ID
	SET @p2=''; -- datumod
	SET @p3=''; -- datumdo
	SET @P4=''; -- id
	CALL crta_insert_promenanepokretneimovine(@p0, @p1, @p2, @p3);
	--------------------------------------------------------------------------------

------------------------------------------- End 19