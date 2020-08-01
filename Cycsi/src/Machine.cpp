#include "Machine.h"
#include "Controller.h"
#include "utils.h"
#include <string>
using namespace std;

Machine::Machine(bool DEBUG) {
    debug = DEBUG;
    Controller controller;
    if(debug)
        message("Machine created");
}

void Machine::load_code(string fname) {
    controller.load_code(fname);
}

void Machine::load_data(string fname) {
    // not implmented yet
}

int Machine::run(void) {
    return controller.run();
}

