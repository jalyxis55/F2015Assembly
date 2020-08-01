Lab1: RPN Calculator
####################

Decision on How we Decided to Implement the Machine
***************************************************
Gina and I met up and we decided that each of us would try to implement our own machine.
So we did and we compared notes, both programs perform as desired. I made a few upgrades
to my code. We decided we would each turn in our own code. But after the group directory
was added, we decided on one code base and this is what we uploaded. We decided to do my 
machine in python because it would be faster to implement.

Scheme
******
I used four functions: main, push, pop, processCommand.

Main
----
    In main, the program opens the file object into a variable called nums. Declares an
    empty list for used as a stack. I used a while loop to iterate throught the file line
    by line. 
        * Inside the while loop. 
            - I used the python function readline().strip() to read a single line. 
              The strip() function gets rid off the new line character that's in front 
              of the string.
            - The it tries to convert the line into an integer, if there's an exception 
              it call the processCommand with two arguments, the line read, and the stack.
    
Push
----
    Push function receives two arguments, number to be pushed onto stack, and the stack.
    I used the append() function and pass the number so it can be appended to the stack.
    I also prints what it's being pushed on the stack, and prints the stack. The function
    does not return anything.

Pop
---
    Pop function receives one argument, the stack. Prints the stack, pops off the top
    number and assigns the number onto a temporary variable. Pops off a second number
    and assigns it to a second temporary variable. Prints the number that were popped off
    and prints the stack again. the function return the two temporary variables.

ProcessCommand
--------------
    The processCommand() function is in charge of processing the string characters that
    the main() function wasn't able to convert to string. The function receives two
    arguments, the string, and the stack.
        * the function uses if/elif to check the string. If the string is one of the
          following commands: ADD, SUB, MUL, DIV, it does it respective action and uses
          the push() function to put the result onto the stack. The two arguments it
          passes are the result and the stack.
        * if the string is PTR, then it prints the top number of the stack
        * if the string is STOP, then it prints a message saying the machine has stopped
          and quits the program.
        * else if it is none of the string characters, then it prints an error message 
          and quits the machine.
    

See `Lab 1 <http://www.co-pylit.org/courses/cosc2325/labs/lab1/index.html>`_
for details.
