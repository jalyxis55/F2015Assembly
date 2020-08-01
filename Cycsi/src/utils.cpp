// Utility routines
#include <iostream>
using namespace std;

#include "utils.h"

void error(string msg) {
    cout << "\tError: " << msg << "Aborting..." << endl;
    exit(1);
}

void message(string msg) {
    cout << "\tDebug: " << msg << endl;
}

