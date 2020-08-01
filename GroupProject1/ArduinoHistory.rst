=============
Board History
=============
Arduino is the name of technology, company, and community that manufactures, develops, and uses microcontrollers for use by anyone. The first Arduino was sold in 2005. It allowed hobbyists and professionals to create a variety of devices that could sense/interact with the world. Projects for the Arduino include LED patterns, motion sensors, timers, and simple robots.

The boards themselves come with one of 3 sizes of AVR microcontrollers (8, 16, and 32 bit). An important component of this open-source invention is the fact that it uses standard connectors. This allows anyone to connect the board to a variety of modules.

Unlike many other microcontroller boards, the Arduino comes preloaded with a boot loader, simplifying uploading programs for the end user. This allows anyone to use a normal computer to write and upload their code.

Basic Board Setup
^^^^^^^^^^^^^^^^^
Power Adapter must have: 

- 9 - 12V DC out
- minimum 250mA output (500mA or 1A recommended)

  - can handle up to 20V (not advised)
- 2.1mm power plug
- "centre positive" plug

Development Tools
^^^^^^^^^^^^^^^^^
Arduino uses open-source software IDE that makes writing code for the board very easy for beginners. The environment is Java-based and can be downloaded from here:

https://www.arduino.cc/en/Main/Software

If the board were wired to a simple lcd display, the following should print out "Hello, world!" :

void setup() {

    // put your setup code here, to run once:
    
    //for an lcd with 16 columns and 2 rows:
    
    lcd.begin(16, 2);
    
    //message to be printed on lcd
    
    lcd.print("Hello, world!");

}

void loop() {

    // put your main code here, to run repeatedly:

}


Processor Architecture
^^^^^^^^^^^^^^^^^^^^^^
Locate the manufacturer’s documentation for the specific processor found on your system. In that documentation find out how the chip is organized, and discuss its major features. You should find a block diagram similar to the one I presented for the Cycsi machine we are building in class.

Processor Assembly Language
^^^^^^^^^^^^^^^^^^^^^^^^^^^
You should also research the basic instruction set contained in your processor. You do not need to explain each instruction, just the major classes of instructions supported by the processor.

Demonstration Project
^^^^^^^^^^^^^^^^^^^^^
Finally, select an external device that your system can control and show that device in action. For all available devices, you should be able to find references on the Internet showing how to use them with your selected system. You will need a breadboard, jumper wires, and perhaps a few other components to fire up these devices. You should itemize the needed parts, and request them for your project.
