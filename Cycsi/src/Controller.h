#ifndef CONTROLLER_H
#define CONTROLLER_H

#include <string>
#include "Memory.h"
#include "Stack.h"
#include "IO.h"
#include "ALU.h"

using namespace std;

class Controller {
    private:
        // set during fetch
        int instruction;
        int mnemonic;

        // set during decode
        int op1;
        int op2;

        // set during execute, stored during retire
        int result;

        // machine state
        bool running;
        int ticks;
        int PC;

        // machine components
        Memory code;
        Memory inst;
        Stack stack;
        IO io;
        ALU alu;

        // Texas four step
        void fetch(void);
        void decode(void);
        void execute(void);
        void retire(void);

    public:
        Controller();               // constructor
        int run(void);              // start the stepping

        // memory loaders
        void load_code(string);
        void load_data(string);

};

#endif
