#include "mainwindow.h"
#include <QApplication>
#include <QTableView>

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    MainWindow w;
    QTableView tbl;
    w.show();
    return a.exec();
}
