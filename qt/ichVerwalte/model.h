#pragma once
#ifndef MODEL_H
#define MODEL_H

#include <string>
using namespace std;

class Model {

public :
    Model(){};
    ~Model(){};
    int connectToDatabase();
    int updateDatabse();
    int updateCell(std::string newValue, std::string tn, std::string cn, string v, string sv, string sc);
int showData();
};
#endif // MODEL_H
