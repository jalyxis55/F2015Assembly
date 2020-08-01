#include "Controller.h"
#include "mnemonics.h"
#include <string>
#include <fstream>
using namespace std;

Controller::Controller() {
    ticks = 0;
    PC = 0;
}

void Controller::fetch(void) {
    instruction = code.read(PC);
    mnemonic = HLT;
}

void Controller::decode(void) {
    // decode instruction, determing mnemonic and operands
    PC++;
}

void Controller::execute(void) {
    if(mnemonic == HLT)
        running = false;
}

void Controller::retire(void) {
}

int Controller::run(void) {
    // start the "Texas Four Step"
    running = true;
    while(running) {
        fetch();
        decode();
        execute();
        retire();
        ticks++;
        if(!running) break;
    }
    return ticks;
}

void Controller::load_code(string fname) {
    ifstream fin;
    int data;

    fin.open(fname);
    if(fin.is_open()) {
        fin >> data;
        int addr = 0;
        while(!fin.eof()) {
            code.write(addr++,data);
        }
    }
}

void Controller::load_data(string fname) {
    // not implemented yet
}
