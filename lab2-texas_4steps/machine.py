import controller

class Machine(object):
    """ 
    This class emulates an actual machine, it has an ALU, I/O, Memory, 
    and a Controller. 
    """

    # internal machine state
    PC = 0      # program counter
    SP = 0      # stack pointer
    R1 = None   # general purpose register 1
    R2 = None   # general purpose register 2
    R3 = None   # general purpose register 3
    inst = None # current instruction
    icode = { "ADD" : 0, "SUB" : 1, "MUL" : 2, "DIV" : 3, "POP" : 4, "PRT" : 5, "PUSH" : 6, "END" : 7 }
    
    def __init__(self, debug): # constructor, second argument should be a bool
        self.debug = debug

        # Create objects to start routine
        #self.memory = memory.Memory(self.debug, self)
        #self.alu = alu.ALU(self.debug)
        #self.io = io.IO(self.debug)     
        self.controller = controller.Controller(self.debug, self)   # passes self, this machine object 
                                                                    # to have access between objects
    
    # start the machine with this code filename
    def run(self, filename): 
        """ 
        The run() function accepts the name of 
        the file program to be processed 
        """
        
        print "\nThe Machine is running..."

        try:
            # open the file and read the lines
            fileObj = open(filename)        
            lines = fileObj.readlines()
            
            # remove delimiters
            lines = map(str.strip, lines)     
            
            # load the program into RAM
            print "Loading", filename
            print lines
            print "Processed: %d lines\n" % len(lines)
            self.controller.memory.loader(lines)
            
            # close the the program file
            fileObj.close() 

        except IOError:
            print "Cannot find file. Machine Halted"
            quit()
        

        # start the clock method of the machine
        self.controller.TFS()

        # reset the machine
        self.reset()
        
        
    # load the code memory
    def loader(self):
        """ 
        The loader() function will be use to load code for the machine's
        internal registers
        """
        pass

    # reset the machine
    def reset(self):
        """
        The reset() function resets the machine
        """

        PC = 0   # program counter
        SP = 0   # stack pointer
        R1 = None   # general purpose register 1
        R2 = None   # general purpose register 2
        R3 = None   # general purpose register 3
        inst = None # current instruction

        
