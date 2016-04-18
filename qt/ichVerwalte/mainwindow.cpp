#include "mainwindow.h"
#include "ui_mainwindow.h"
#include <iostream>
#include <pqxx/pqxx>
#include "model.h"

using namespace std;

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow),
    Model m; //hier würde ich gerne m erstellen, lässt er aber nicht.
{
    ui->setupUi(this);
    //m->connectToDatabase();
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::on_pushButton_clicked()
{
    //Hier soll die Funktion rein, welche die Model anspricht
}
