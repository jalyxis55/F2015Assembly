#ifndef IO_H
#define IO_H

#include <string>
using namespace std;

class IO {
    public:
        IO();                       // constructor
        void out(int);              // output integer on console
        int in(void);               // input integer from user
};

#endif
