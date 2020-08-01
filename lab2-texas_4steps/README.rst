Lab2: Texas Four Step
#####################

Run this program by: python main.py test.txt

Steps of the Machine
--------------------

When main.py is run, the machine object is built.

The parts of the machine object are built at this time:

- Memory
- Controller (passed by weak reference itself, gives us access to memory, ALU, and IO)
- ALU
- IO

The machine object's run function is called.

Run opens the text file. If run is successful, the loader function is called.

Loader copies the entire file into the memory objet's RAM and goes back to the run function.

The run function calls the TFS function to "sequence the dance." TFS does the fetch, decode, execute, and retire function.

Fetch brings the next index from the data array.

- Data array at [index] gets read

 - Is it a number?

  - If so, go to the Controller object's decode function

 - If not a number: is it an instruction

  - Decode checks it it's a valid instruction

  - Execute uses the instruction

   - PRT prints the top number from the stack
   - END quits the program

  - If valid operator:

   - Pop the top 2 numbers
   - Operate on the 2 numbers
   - Push product back onto stack

Decode checks if it's valid and sends it to execute

Execute pushes the number onto the stack

Retire closes the loop


