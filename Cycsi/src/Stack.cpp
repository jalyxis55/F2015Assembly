#include "Stack.h"

Stack::Stack() {
    SP = -1;
}

void Stack::push(int data) {
    STACK[++SP] = data;
}

int Stack::pop(void) {
    return STACK[SP--];
}

