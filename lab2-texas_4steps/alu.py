class ALU(object):
    """ Arithmetic and Logic Unit """
    
    def __init__(self, debug):      # constructor, second argument is bool
        self.debug = debug
    
    # the respective computation will be processed according to the icode number
    # and will return the result of that computation to the calling function, which
    # is the execute() function, in the else: step inside the if statement
    def math(self, icode, R1, R2):
        if icode == 0:      # checks for ADD
            return R1 + R2
        elif icode == 1:    # checks for SUB
            return R1 - R2  
        elif icode == 2:    # checks for MUL
            return R1 * R2
        elif icode == 3:    # checks for DIV
            return R1 / R2
        else:
            return
