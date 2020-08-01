#include "ALU.h"
#include "mnemonics.h"

ALU::ALU() {
}

int ALU::math(int op, int op1, int op2) {
    int result;
    switch (op) {
        case ADD: result =  op1 + op2; break;
        case SUB: result =  op1 - op2; break;
        case MUL: result =  op1 * op2; break;
        case DIV: result =  op1 / op2; break;
    }
    return result;
}

int ALU::logic(int op, int op1, int op2) {
    int result;
    switch (op) {
        case AND: result = 0; break;
        case OR: result = 0; break;
        case XOR: result = 0; break;
        case NOT: result = 0; break;
    }
    return result;
}

