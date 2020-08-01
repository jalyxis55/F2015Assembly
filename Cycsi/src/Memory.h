#ifndef MEMORY_H
#define MEMORY_H

#define MAX_RAM 500

class Memory {
    int RAM[MAX_RAM];

    public:
        Memory();
        int read(unsigned int);
        void write(unsigned int, int);
};

#endif
