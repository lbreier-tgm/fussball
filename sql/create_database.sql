# DATENBANKERSTELLUNG
# -> Server starten
# -> SSH
# -> psql login
# Datenbank, User erzeugen & Rechte verteilen

CREATE DATABASE verein;
CREATE USER manager WITH PASSWORD 'iderfrein';
GRANT ALL ON DATABASE verein TO manager;