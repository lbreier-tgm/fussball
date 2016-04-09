# ======================================
# 			SQL - AUFGABEN
# ======================================

# S1.) (Fan-Club Betreuung) Waehlen Sie "per Hand" die Personalnummer eines Angestellten aus Ihren Testdaten aus.

# Auswahl : 10000

# Schreiben Sie eine SQL-Anfrage, die jene Fan-Clubs ermittelt, die dieser Angestellte im Moment nicht betreut.
# Geben Sie zu jedem derartigen Fan-Club die Standort-ID und den Namen des Fan-Clubs aus. DONE
# Bemerkung: Ein Fan-Club wird von einem Angestellten im Moment nicht betreut,
# wenn entweder der Angestellte diesen Fan-Club ueberhaupt nie betreut hat
# oder wenn das heutige Datum (= sysdate) ausserhalb des Betreuungszeitraums liegt.
# Vergessen Sie nicht, jene Fan-Clubs zu beruecksichtigen,
# die von ueberhaupt keinem Angestellten betreut werden (dieser Fall sollte zwar laut Datenmodell nicht vorkommen.
# Die Einhaltung dieser Bedingung wird aber vermutlich vom Datenbanksystem nicht ueberprueft)!

SELECT name, sid
FROM betreuung
WHERE persnr != 10000
AND persnr IS NOT NULL
OR anfang > sysdate
OR ende < sysdate;

# S2.) (Die eifrigsten Angestellten) Schreiben Sie eine SQL-Anfrage, die den Nachnamen und
# die Personalnummer jener Angestellten ausgibt, die im Moment saemtliche Fan-Clubs betreuen. Ordnen Sie die Nachnamen alphabetisch.
# Bemerkung: Passen Sie die Testdaten so an, dass diese Anfrage zumindest zwei Angestellte liefert.

(SELECT nname, persnr
ORDER BY nname DESC
FROM person
INNER JOIN angestellter ON angestellter.persnr = person.persnr)
LEFT OUTER JOIN betreuung ON person.persnr = fanclub.persnr;


# S3.) (Spielereinsaetze) Geben Sie fuer alle Spiele des Jahres 2015 jeweils alle Spieler und die Dauer ihres Einsatzes aus, d.h.: Gesucht sind alle Tupel (mannschaft, datum, vorname, nachname, dauer), mit folgender Eigenschaft:
#        "mannschaft" ist die Bezeichnung der Mannschaft, die gespielt hat.
#        "datum" ist das Datum, an dem das Spiel stattfand.
#        "vorname" und "nachname" beziehen sich auf einen Spieler, der bei diesem Spiel zum Einsatz kam.
#        "dauer" gibt die Dauer des Einsatzes (in Minuten) dieses Spielers bei diesem Spiel an.
SELECT mannschaft, datum, person.vname, person.nname, dauer
FROM einsatz
NATURAL JOIN person
WHERE datum
BETWEEN '2015-01-01'
AND '2015-12-31';


# S4.) (Spieler-Ranking) Geben Sie fuer jeden Spieler den Vornamen und Nachnamen
# sowie die Gesamtdauer ("gesamtdauer") der von ihm bei Spielen im Jahr 2015 geleisteten Einsaetze aus.
# Vergessen Sie nicht, jene Spieler des Vereins zu beruecksichtigen, die im Jahr 2015 bei keinem einzigen Spiel mitgespielt haben (d.h. gesamtdauer = 0).
# Ordnen Sie die Ausgabe in absteigender Gesamtdauer. Bei Gleichheit der Gesamtdauer sollen die Spieler in alphabetischer Reihenfolge (zuerst des Nachnamen, dann des Vornamen) sortiert werden.
SELECT vname, nname, (SUM(einsatz.dauer)) AS gesamtdauer
FROM (SELECT vname, nname
FROM person
NATURAL JOIN spieler) AS spieler
ORDER BY gesamtdauer DESC;

# S5.) (Der fleissigste Spieler) Geben Sie den Vornamen und Nachnamen jenes Spielers aus, von dem die unter
# b) berechnete Gesamtdauer am groessten ist, d.h.: dieser Spieler ist bei Spielen im Jahr 2015 insgesamt am laengsten im Einsatz gewesen. Falls sich mehrere Spieler den ersten Platz teilen (d.h. sie kommen auf die gleiche Gesamtdauer), dann sollen diese in alphabetischer Reihenfolge (zuerst des Nachnamen, dann des Vornamen) geordnet werden. Der Fall, dass im Jahr 2015 ueberhaupt kein Spiel stattfand, darf ignoriert werden.
# Bemerkung: Beruecksichtigen Sie bei Ihren Testdaten die Situation, dass sich zumindest 2 Spieler den ersten Platz teilen.
SELECT vname, nname, (SUM(einsatz.dauer)) AS gesamtdauer
FROM (SELECT vname, nname FROM person NATURAL JOIN spieler) AS spieler,
ORDER BY gesamtdauer DESC
LIMIT 1;


# S6.) Schreiben Sie CREATE und DROP Befehle fuer eine View, die alle Informationen ueber Trainer aus der Personen- und Trainer-Tabelle zusammenfuegt, d.h.: sowohl die allgemeinen Personendaten (Personalnummer, Vorname, Nachname, Geschlecht und Geburtsdatum) als auch die Trainer-spezifischen Informationen (Gehalt sowie Beginn und Ende der Vertragsdauer). In Summe ist also folgende View erforderlich:
#    Trainer_view (persnr, vname, nname, geschlecht, gebdat, gehalt, von, bis).
CREATE VIEW trainer_view AS
SELECT persnr, vname, nname, geschlecht, gebdat, gehalt, von, bis
FROM person
NATURAL JOIN trainer;

DROP VIEW Trainer_view;
