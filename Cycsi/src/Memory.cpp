#include "Memory.h"

Memory::Memory() {
}

int Memory::read(unsigned int addr) {
    return RAM[addr];
}

void Memory::write(unsigned int addr, int data) {
    RAM[addr] = data;
}

