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

void connectToDatabase(){
    int main(int argc, char* argv[])
    {
       try{
          connection C("dbname=testdb user=postgres password=cohondob \
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
    }
}

void MainWindow::on_pushButton_clicked()
{
    connectToDatabase();
}
