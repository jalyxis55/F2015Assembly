#ifndef ALU_H
#define ALU_H

class ALU {
    public:
        ALU();                  // constructor
        int math(int op, int op1, int op2);
        int logic(int op, int op1, int op2);
};

#endif
