# Lab1 - Freddy & Gina 

def main():
    from sys import argv
    # script and the name of the file to be process
    script, filename = argv
    
    # file object assigned to nums
    try:
        nums = open(filename)
    except IOError:
        print "Cannot find file. Quiting..."
        quit()
        
    # empty list to be used as a stack
    myStack = []
    
    # Welcome message
    print "\n\n..........Welcome to the RPNCalculator..........\n"
    # while loop will iterate through file reading lines
    while True:
        # extract a line
        line = nums.readline().strip()
 
        try:
            line = int(line)
            push(line, myStack)
        except:
            processCommand(line, myStack)

# function to push value onto stack
def push(value, myStack):
    myStack.append(value)
    print "push: %d \t %r" % (value, myStack)

# function returns and pops value off the stack
def pop(myStack):
    print "Stack:\t\t %r" % (myStack)
    temp2 = myStack.pop()
    temp1 = myStack.pop()
    print "Pop: %d , %d \t %r" % (temp1, temp2, myStack)
    return (temp1, temp2) 

def processCommand(string, myStack):
    dashes = "------------------------------"
    
    if string.upper() == "ADD":
        print dashes
        print "\tADDING"

        # load the the last 2 values on temp variables and add them to result
        num1, num2 = pop(myStack)
        result = num1 + num2
        print "%d + %d = %d" % (num1, num2, result)

        # Push result onto stack
        push(result, myStack)

    elif string.upper() == "SUB":
        print dashes
        print "\tSUBTRACTING"

        # load the the last 2 values on temp variables and add them to result
        num1, num2 = pop(myStack)
        result = num1 - num2
        print "%d - %d = %d" % (num1, num2, result)
        
        # Compute and push result onto stack
        push(num1 - num2, myStack)

    elif string.upper() == "MUL":
        print dashes
        print "\tMULTIPLYING"

        # load the the last 2 values on temp variables and add them to result
        num1, num2 = pop(myStack)
        result = num1 * num2
        print "%d * %d = %d" % (num1, num2, result)
        
        # Compute and push result onto stack
        push(num1 * num2, myStack)

    elif string.upper() == "DIV":
        print dashes
        print "\tDIVIDING"

        # load the the last 2 values on temp variables and add them to result
        num1, num2 = pop(myStack)
        result = num1 / num2
        print "%d / %d = %d" % (num1, num2, result)
        
        # Compute and push result onto stack
        push(num1 / num2, myStack)

    elif string.upper() == "PRT":
        # print the last element of the list
        print "------------------------------"
        print "\tPRINTING\n\nResult: %r" % myStack[-1]

    elif string.upper() == "STOP":
        print "------------------------------"
        print "\tSTOPPED\n\n*****Machine Halted*****\n"
        quit()

    else:
        print "\nNot a valid character or command, or no STOP command detected"
        quit()

main()
