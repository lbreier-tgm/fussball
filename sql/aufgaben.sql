# ======================================
# 			SQL - AUFGABEN
# ======================================

# S1.) (Fan-Club Betreuung) Wählen Sie "per Hand" die Personalnummer eines Angestellten aus Ihren Testdaten aus.

# Auswahl : 10000

# Schreiben Sie eine SQL-Anfrage, die jene Fan-Clubs ermittelt, die dieser Angestellte im Moment nicht betreut.
SELECT name
FROM betreuung
WHERE persnr = 10000;


# Geben Sie zu jedem derartigen Fan-Club die Standort-ID und den Namen des Fan-Clubs aus.
# Bemerkung: Ein Fan-Club wird von einem Angestellten im Moment nicht betreut,
# wenn entweder der Angestellte diesen Fan-Club überhaupt nie betreut hat
# oder wenn das heutige Datum (= sysdate) außerhalb des Betreuungszeitraums liegt.

# Vergessen Sie nicht, jene Fan-Clubs zu berücksichtigen,
# die von überhaupt keinem Angestellten betreut werden (dieser Fall sollte zwar laut Datenmodell nicht vorkommen.
# Die Einhaltung dieser Bedingung wird aber vermutlich vom Datenbanksystem nicht überprüft)!
