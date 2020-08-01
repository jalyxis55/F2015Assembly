class IO(object):
    """ Input/Ouput """
    
    def __init__(self, debug):      # constructor, second argument is bool
        self.debug = debug
        
    def out(self, output):
        print "-" * 20
        print "Result"
        print output

