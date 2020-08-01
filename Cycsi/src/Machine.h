#ifndef MACHINE_H
#define MACHINE_H

#include <string>
#include "Controller.h"
using namespace std;

class Machine {
    private:
        Controller controller;      // controller module
        bool debug;

    public:
        Machine(bool);                  // constructor
        void load_code(string);     // load code file
        void load_data(string);     // oad initialized data
        int run(void);             // start the stepping
};

#endif
