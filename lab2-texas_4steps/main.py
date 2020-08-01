from sys import argv
import machine

def main():
    """ Driver program to begin RPN Calculator """
    
    # script and filename import
    script, filename = argv
     
    # Welcome Message
    print '.' * 10, "RPNcalc v0.2", '.' * 10

    # create our machine
    m = machine.Machine(True) # argument passed should be a bool, True or False
    m.run(filename)

main() # run main
