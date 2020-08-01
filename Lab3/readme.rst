Lab 3 - CPU Simulator
#####################

We found an ARM simulator on git hub. The project was implemented using c++.
The project is by dusek and the name of the project is 'army'. The project 
executes binary elf files. It comes with some test demos that demonstrate the 
results on the command line. In order to compile the ARM Emulator, you need 
CMake and cppunit. 

After installing CMake and cppunit. Compile the program by:

    cmake .

and then 

    make

After 'ARMY' is installed. You can run a demo code provided by the project,
like so:

    ./armyexec 0 test/images/fibonacci/fibonacci.elf 7

The project was found at:
https://github.com/dusek/army
