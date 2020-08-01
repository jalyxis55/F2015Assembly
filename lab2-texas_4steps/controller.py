import memory, io, alu 

class Controller(object):
    """ Controller for Machine """
    # this is just to check if ALU needs to be called
    computableInst = ["ADD", "SUB", "MUL", "DIV"]
    
    def __init__(self, debug, machineObj):  # constructor, second argument is debug flag
        self.debug = debug
        self.machine = machineObj # reference the machine object for communication between objects
	self.memory = memory.Memory(self.debug) 
        self.alu = alu.ALU(self.debug)
        self.io = io.IO(self.debug) 
	
   
    def fetch(self):
        
        # retrieves the value from RAM on a certain index and temporarily puts it in
        # in one of the registers
        self.machine.R1 = self.memory.read(self.machine.PC)
        
        # for DEBUGGING
        if self.debug:
            print "\tfetch: (%d)" % self.machine.PC
        
        # update the program counter
        self.machine.PC += 1

    def decode(self):
        
        # Check to see if it's a number or command
        try:
            # try to convert the line to an int, if successful
            # set it in a temporary register, assign the inst variable in machine with 
            # PUSH command
            self.machine.R1 = int(self.machine.R1)
            self.machine.inst = "PUSH"

            # for DEBUGGING
            if self.debug:
                print "\t\tread(%d -> %d)" % (self.machine.PC, self.machine.R1)
                print "\t\t\tchecking for number"
                print "\t\t\tnumber found: %d" % self.machine.R1

        except:
            # convert the instruction to uppercase
            self.machine.R1 = self.machine.R1.upper() 
            
            # checks for valid instruction
            for key in self.machine.icode:
                if key == self.machine.R1:    # checks R1 for valid instructions
                    
                    # if it is the right command, it'll assign the command to machine.inst
                    self.machine.inst = key
                    return    # if key found it will return to the calling method
                
            print "Not a valid instruction. Teminating..."
            quit()
    
    def execute(self):
        
        # for loop checks to see if it's add, sub, mul, div
        # if it is, it calls the ALU,
        if self.machine.inst == "PRT":
            if len(self.memory.STACK) > 0:
                
                # retrieve the value to be printed
                output = self.memory.STACK[-1]
                
                # for DEBUGGING
                if self.debug:
                    print "\t\tread(%r -> %r)" % (self.machine.PC, "PRT")
                    print "\t\t\tchecking for number"
                    print "\tDecoding(PRT) valid instruction. code is: 5"
                    print "\texecute: PRT(5)"
                    print "\t\tpop <- %r" % output
                    print "> %r" % output
                    print "\t\tprt <- %r" % output
                    print "\tretire(%r)\n" % output
                else:
                    # call IO to print    
                    self.io.out(output)
            else:
                print "Stack is empty. Must have at least one number to print Terminating"
                quit()
            return
        elif self.machine.inst == "END":

            # for DEBUGGING
            if self.debug:
                print "\t\tread(%r -> %r)" % (self.machine.PC, "END")
                print "\t\t\tchecking for number"
                print "\tDecoding(END) valid instruction. code is: 7"
                print "\texecute: END(7)"
                print "\t\tEND exiting..."
                print "\tretire(%r)" % self.memory.STACK[-1]
                
            # reset the machine
            self.machine.reset()
            print "\nMachine halted normally"

            # exit program
            quit()
            
        elif self.machine.inst == "POP":    
            self.machine.R1 = self.memory.pop()
        elif self.machine.inst == "PUSH":

            # for DEBUGGING
            if self.debug:
                print "\tDecoding(%r) valid instruction. code is: %r" % (self.machine.inst, 6)
                print "\texecute: PUSH(6)"
                print "\t\tpush %r" % self.machine.R1
                print "\t\t\tpush -> %r" % self.machine.R1
                print "\tretire(%r)\n" % self.machine.R1

            # push value onto stack
            self.memory.push(self.machine.R1)
        
        # else will check if ADD, SUB, MUL, DIV are one of the commands
        else:

            # loops through computableInst which includes the valid computation commands
            for key in self.computableInst:

                # if the machine's current instruction is equal to one of the valid
                # computation commands, the it will ALU so it can compute the last 2 numbers
                # on the stack
                if key == self.machine.inst:
                    if len(self.memory.STACK) > 0:

                        # store icode number
                        icode = self.machine.icode[self.machine.inst]

                        # Call the appropriate computation command
                        self.machine.R2 = self.memory.pop()
                        self.machine.R1 = self.memory.pop()

                        # register 3 holds the result
                        self.machine.R3 = self.alu.math(icode, self.machine.R1, self.machine.R2)

                        # pushes the result back onto the stack
                        self.memory.push(self.machine.R3)
                        
                        # for DEBUGGING
                        if self.debug:
                            print "\t\tread(%r -> %r)" % (self.machine.PC, key)
                            print "\t\t\tchecking for number"
                            print "\tDecoding(%r) valid instruction. code is: %r" % (key, icode)
                            print "\texecute: %r(%r)" % (key, icode)
                            print "\t\tpop <- %r" % self.machine.R2
                            print "\t\tpop <- %r" % self.machine.R1
                            print "\t\tpush -> %r" % (self.machine.R3)
                            print "\t%r = %r(%r, %r)" % (self.machine.R3, key, self.machine.R1, self.machine.R2) 
                            print "\tretire(%r)\n" % self.machine.R3
                         
                    else:
                        print "There are not enough numbers on stack to compute. Terminating"
                        quit()
                
    def retire(self):       
        print "code for retire() function"
        

    def TFS(self):      # sequence the dance
        
        # Begin reading file program that was loaded
        while True:
            self.fetch()
            self.decode()
            self.execute()
            '''
            self.retire()
            '''
