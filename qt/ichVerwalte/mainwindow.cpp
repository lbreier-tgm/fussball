#include "mainwindow.h"
#include "ui_mainwindow.h"
#include <iostream>
#include <pqxx/pqxx>


using namespace std;

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow),
    m(new Model)
{
    ui->setupUi(this);
}

MainWindow::~MainWindow()
{
    delete ui;
    delete m;
}

void MainWindow::on_pushButton_clicked()
{
     m->connectToDatabase();
}
