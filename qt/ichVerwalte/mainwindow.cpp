#include "mainwindow.h"
#include "ui_mainwindow.h"
#include <iostream>
#include <pqxx/pqxx>
#include <QTableView>
#include <QStandardItemModel>
#include <QtSql>

using namespace std;

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow),
    m(new Model)

{
    ui->setupUi(this);
    QStandardItemModel *model = new QStandardItemModel(2,3,this); //2 Rows and 3 Columns
    model->setHorizontalHeaderItem(0, new QStandardItem(QString("Personen ID")));
    model->setHorizontalHeaderItem(1, new QStandardItem(QString("Vorname")));
    model->setHorizontalHeaderItem(2, new QStandardItem(QString("Nachname")));
    //vector<some magic words> = m->getData();
    // Möchte Array erstellen um diese in das QStandardItemModel zuspeichern
    QStandardItem *inputs = new QStandardItem(QString("ColumnValue"));
    model->setItem(0,0,inputs);
    /* Idee :
     *
     *  for(int i = 0; i < inputs.length; i++) {
     *      for(int j = 0; j < inputs.length; j++){
     *             model->setItem(i,j,inputs[i*j]);
     *      }
     *  }
     */

    ui->tableView->setModel(model);

}



MainWindow::~MainWindow()
{
    delete ui;
    delete m;
}

void MainWindow::on_pushButton_clicked()
{
     m->connectToDatabase();
     m->showData();
}
