class Memory(object):
    """ Machine's Memory """

    RAM = []        # code memory
    STACK = []      # data memory
    DEBUG = None    # turn on debuggin messages, bool

    def __init__(self, debug): # constructor, second argument is a bool
        self.debug = debug
        #self.machine = machineObj

    # code memory access routines
    def read(self, addr):
        """
        read() function accepts the address of RAM that needs to be read
        and returns it
        """
  
        # reads data from RAM on a certain index
        return self.RAM[addr]

    def write(self, addr, data):
        """
        write() function accepts the address and data to be written to RAM
        """

        # write data onto RAM on a certain index
        self.RAM[addr] = data

    # stack access routines
    def push(self, value):
        """
        push() function accepts the value that needs to be pushed on to stack
        """

        # append value to stack
        self.STACK.append(value)

    def pop(self):

        # pop and return value
        return self.STACK.pop()

    # code load routine, load file into ram
    def loader(self, lines):

        self.RAM = lines
