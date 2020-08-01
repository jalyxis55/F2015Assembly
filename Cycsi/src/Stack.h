#ifndef STACK_H
#define STACK_H

#define MAX_STACK 500

class Stack {
    private:
        int SP;
        int STACK[MAX_STACK];

    public:
        Stack();
        void push(int);
        int pop(void);
};

#endif
