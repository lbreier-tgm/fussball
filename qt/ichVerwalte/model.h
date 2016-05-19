#pragma once
#ifndef MODEL_H
#define MODEL_H

#include <string>
#include <vector>

using namespace std;

class Model {

public :
    Model(){};
    ~Model(){};
    int connectToDatabase();
    int updateDatabse();
    int updateCell(std::string newValue, std::string tn, std::string cn, string v, string sv, string sc);
    int showData();
    union LosUnion{
      int id;
      string vn;
      string nn;
    };
    std::vector<Model::LosUnion> getData();
};
#endif // MODEL_H
