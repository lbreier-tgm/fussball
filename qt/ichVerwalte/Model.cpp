#include <pqxx/pqxx>
#include <iostream>
#include "model.h"

using namespace pqxx;
using namespace std;


int Model::connectToDatabase(){
    try{
       //Verbindung mit Verein herstellen - Testfunktion zum Verbindung testen.
       connection C("dbname=verein user=manager password=iderfrein\
       hostaddr=127.0.0.1 port=5432");
       if (C.is_open()) {
          cout << "Opened database successfully: " << C.dbname() << endl;
       } else {
          cout << "Can't open database" << endl;
          return 1;
       }
       C.disconnect ();
    }catch (const std::exception &e){
       cerr << e.what() << std::endl;
       return 1;
    }
    return 0;
}


int Model::showData(){
    string sql;
    connection C("dbname=verein user=manager password=iderfrein\
    hostaddr=127.0.0.1 port=5432");
    try{
       if (C.is_open()) {
          cout << "Opened database successfully: " << C.dbname() << endl;
       } else {
          cout << "Can't open database" << endl;
          return 1;
       }
    /* Create SQL statement */
    sql = "SELECT * FROM spieler";

    /* Create a non-transactional object. */
    nontransaction N(C);

    /* Execute SQL query */
    result R( N.exec( sql ));

    /* List down all the records */
    /* statt in das ein cout zu speichern -> vector
       diesen vector in die Klasse, wo sich die QTable befindet übergeben und Item für Item in die Tabelle füllen*/
    for (result::const_iterator c = R.begin(); c != R.end(); ++c) {
       cout << "Personennummer : " << c[0].as<int>() << endl;
       cout << "Position : " << c[1].as<string>() << endl;
       cout << "Gehalt : " << c[2].as<double>() << endl;
       /*cout << "von : " << c[3].as< >() << endl;
       cout << "bis : " << c[4].as<float>() << endl;*/
    }
    cout << "Operation done successfully" << endl;
    C.disconnect ();
    } catch (const std::exception &e){
        cerr << e.what() << std::endl;
    return 1;
    }
return 0;
}

int Model::updateCell(string newValue, string tn, string cn, string v, string sv, string sc){
    string wr = newValue;
    string table_name = tn;
    string column = cn;
    string value = v;
    string some_value = sv;
    string some_column = sc;
    string sql;
    //Verbindung
    connection C("dbname=verein user=manager password=iderfrein\
    hostaddr=127.0.0.1 port=5432");
    try{
       if (C.is_open()) {
          cout << "Opened database successfully: " << C.dbname() << endl;
       } else {
          cout << "Can't open database" << endl;
          return 1;
       }
    /* UPDATE - SQL Befehl */
    sql = "UPDATE " + table_name + " SET " + column + "=" + value + " WHERE " + some_column + "=" + some_value;

    nontransaction N(C);

    /* Ausfuehren des SQL - Update Befehls */
    result R( N.exec( sql ));

    } catch (const std::exception &e){
        cerr << e.what() << std::endl;
    return 1;
    }
            return 0;
}
