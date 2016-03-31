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
  persnr INTEGER PRIMARY KEY REFERENCES person,
  ueberstunden NUMERIC(3,0) NOT NULL,
  gehalt NUMERIC(8,2) NOT NULL,
  e_mail VARCHAR(50) NOT NULL,
);

CREATE TABLE mitglied (
  persnr INTEGER PRIMARY KEY REFERENCES person,
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
  persnr INTEGER PRIMARY KEY REFERENCES person,
  gehalt NUMERIC(8,2) NOT NULL,
  von DATE NOT NULL,
  bis DATE NOT NULL
);

CREATE TABLE mannschaft (
  bezeichnung VARCHAR(40) PRIMARY KEY,
  naechstes_spiel DATE NOT NULL,
  klasse VARCHAR(20),
  kapitaen INTEGER NOT NULL,
  FOREIGN KEY(persnr) REFERENCES spieler
);

# WIE GEHT UNIQUE
CREATE TABLE ist_trainer_von (
  trainernr INTEGER FOREIGN KEY REFERENCES person.persnr UNIQUE,
  manbez VARCHAR(40) FOREIGN KEY REFERENCES mannschaft.bezeichnung UNIQUE,
  trainertyp BOOLEAN UNIQUE,
  PRIMARY KEY(trainernr, manbez, trainertyp)
);


CREATE TABLE mannschaftspieler (
  bezeichnung VARCHAR(40),
  persnr INTEGER PRIMARY KEY REFERENCES spieler,
  nummer NUMERIC(2,0)
  PRIMARY KEY(persnr),
  FOREIGN KEY(persnr) REFERENCES spieler
);

