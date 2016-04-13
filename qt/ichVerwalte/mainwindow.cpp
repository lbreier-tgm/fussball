#include "mainwindow.h"
#include "ui_mainwindow.h"
#include <iostream>
#include <pqxx/pqxx>

using namespace std;
using namespace pqxx;

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);
}

MainWindow::~MainWindow()
{
    delete ui;
}

/*void connectToDatabase(){
    QSqlDatabase db = QSqlDatabase::addDatabase("QMYSQL");
    db.setHostName("localhost");
    db.setDatabaseName("verein");
    db.setUserName("manager");
    db.setPassword("iderfrein");
    bool ok = db.open();
}*/

int connectToDatabase(){
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

int updateDatabase(){
    string sql;
    try{
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
    /* Create SQL statement */
    sql = "SELECT * FROM spieler";

    /* Create a non-transactional object. */
    nontransaction N(C);

    /* Execute SQL query */
    result R( N.exec( sql ));

    /* List down all the records */
    for (result::const_iterator c = R.begin(); c != R.end(); ++c) {
       cout << "ID = " << c[0].as<int>() << endl;
       cout << "Name = " << c[1].as<string>() << endl;
       cout << "Age = " << c[2].as<int>() << endl;
       cout << "Address = " << c[3].as<string>() << endl;
       cout << "Salary = " << c[4].as<float>() << endl;
    }
    cout << "Operation done successfully" << endl;
    C.disconnect ();
    } catch (const std::exception &e){
        cerr << e.what() << std::endl;
    return 1;
    }
}


void MainWindow::on_pushButton_clicked()
{
    connectToDatabase();
}
