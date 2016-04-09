# ==========================================
# BREIER - PROTOKOLL UND BEFEHLE - FUSSBALL
# ==========================================

CREATE SEQUENCE pid START WITH 10000 INCREMENT BY 2;

#Tabellen kreieren
CREATE TABLE person (
  persnr SERIAL PRIMARY KEY,
  vname VARCHAR(30),
  nname VARCHAR(30),
  geschlecht VARCHAR(1),
  gebdat DATE
);

CREATE TABLE angestellter(
  persnr SERIAL PRIMARY KEY REFERENCES person,
  ueberstunden NUMERIC(3,0) NOT NULL,
  gehalt NUMERIC(8,2) NOT NULL,
  e_mail VARCHAR(50) NOT NULL
);

CREATE TABLE mitglied (
  persnr SERIAL PRIMARY KEY REFERENCES person,
  beitrag NUMERIC(8,2) NOT NULL
);

CREATE TABLE spieler (
  persnr INTEGER PRIMARY KEY REFERENCES person,
  position VARCHAR(20) NOT NULL,
  gehalt NUMERIC(8,2) NOT NULL,
  von DATE NOT NULL,
  bis DATE NOT NULL
);

CREATE TABLE trainer (
  persnr SERIAL PRIMARY KEY REFERENCES person,
  gehalt NUMERIC(8,2) NOT NULL,
  von DATE NOT NULL,
  bis DATE NOT NULL
);

CREATE TABLE mannschaft (
  bezeichnung VARCHAR(40) PRIMARY KEY,
  naechstes_spiel DATE NOT NULL,
  klasse VARCHAR(20),
  kapitaen INTEGER REFERENCES spieler.persnr
);


CREATE TABLE ist_trainer_von (
  trainernr SERIAL FOREIGN KEY REFERENCES person.persnr UNIQUE,
  manbez VARCHAR(40) FOREIGN KEY REFERENCES mannschaft.bezeichnung UNIQUE,
  trainertyp BOOLEAN UNIQUE,
  PRIMARY KEY(trainernr, manbez, trainertyp)
);


CREATE TABLE mannschaftspieler (
  bezeichnung VARCHAR(40),
  persnr SERIAL PRIMARY KEY REFERENCES spieler,
  nummer NUMERIC(2,0),
  PRIMARY KEY(persnr),
  FOREIGN KEY(persnr) REFERENCES spieler
);

CREATE TABLE standort (
  sid INTEGER PRIMARY KEY CHECK (sid > 0),
  land VARCHAR(30) NOT NULL,
  plz VARCHAR(10) NOT NULL,
  ort VARCHAR(30) NOT NULL,
);

CREATE TABLE fanclub (
  name VARCHAR(30) PRIMARY KEY,
  sid INTEGER FOREIGN KEY REFERENCES standort.sid,
  gegruendet DATE NOT NULL
);

CREATE TABLE ist_obmann (
  persnr SERIAL FOREIGN KEY REFERENCES mitglied.persnr UNIQUE,
  name VARCHAR(30) FOREIGN KEY REFERENCES fanclub.name UNIQUE,
  sid INTEGER FOREIGN KEY REFERENCES fanclub.sid UNIQUE
  PRIMARY KEY(persnr, name, sid)
);

CREATE TABLE betreuung (
  name VARCHAR(30) FOREIGN KEY REFERENCES fanclub.name,
  sid INTEGER FOREIGN KEY REFERENCES fanclub.name,
  persnr SERIAL FOREIGN KEY REFERENCES angestellter.persnr,
  anfang DATE NOT NULL,
  ende DATE NOT NULL
)

CREATE TABLE spiel (
  datum DATE PRIMARY KEY,
  mannschaft FOREIGN KEY REFERENCES mannschaft.bezeichnung,
  gegner VARCHAR(30),
  ergebnis VARCHAR(3)
)

CREATE TABLE einsatz (
  datum DATE PRIMARY KEY REFERENCES spiel.datum,
  mannschaft VARCHAR(30) PRIMARY KEY REFERENCES spiel.mannschaft,
  persnr INTEGER PRIMARY KEY REFERENCES spieler.persnr,
  dauer NUMERIC(2,0)
)
