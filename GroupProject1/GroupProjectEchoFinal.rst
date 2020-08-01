Team Echo: Gina Hall, Freddy Esteban, Jennifer Shelby

=========================
Group Project 1 - Arduino
=========================

Board History
^^^^^^^^^^^^^

Arduino is the name of technology, company, and community that manufactures, develops, and uses microcontrollers for use by anyone. The first Arduino was sold in 2005. It is an open-source computer hardware and software company. This allows hobbyists and professionals to create a variety of devices that can sense/interact with the world.

It started as a project for students at the Interaction Design Institute Ivrea in Ivrea, Italy. Massimo Banzi, one of the founders, taught at Ivrea. Other team members include David Cuatielles, Tom Igoe, Gianluca Martino, and David Mellis

Basic Board Setup
^^^^^^^^^^^^^^^^^

Must have:

-Power Adapter
	*9-12V DC out
	*Minimum 250mA output (500mA or 1A recommended)

-Bread Board

-Resistors

-LEDs (Red and Green)

-Wires

-Proximity Sensor

Development Tools
^^^^^^^^^^^^^^^^^

Arduino uses an open-source software IDE that makes writing code for the board very easy for beginners. The environment is Java based and can be download from: https://www.arduino.cc/en/Main/Software

If the board were wired to a simple lcd display, the following should print out "Hello, world!":

void setup(){
	//put your setup coded here, to run once:
	//for an lcd with 16 columns and 2 rows:
	lcd.begin(16, 2);
	
	//message to be printed on lcd
	lcd.print("Hello, world!");
}

void loop(){
	//put your main code here, to run repeatedly:
}

Processor Architecture
^^^^^^^^^^^^^^^^^^^^^^

The AVR uses a Harvard architecture to maximize performance and parallelism.

---------------------------
ALU - Arithmetic Logic Unit
---------------------------

Operates in direct connection with all 32 general purpose working registers.The ALU operations are divided into three main categories -- arithmetic, logical, and bit-functions. Operations work between registers or registers and immediate values.

-----------------------------
General Purpose Register File
-----------------------------

It has 32, 8-bit general purpose registers R0 to R31 

Supports the following input/output schemes:

	-One 8-bit output operand and one 8-bit result input

	-Two 8-bit output operands and one 8-bit result input

	-Two 8-bit output operands and one 16-bit result input

	-One 16-bit output operand and one 16-bit result input

Each register is assigned a data memory address, mapping them directly to the first 32 locations of the user Data Space

-------------
Stack Pointer
-------------

Mainly used for storing temporary data, local variables and return addresses. Grows from higher to lower memory locations

--------
Memories
--------

In-System Reprogrammable Flash Program Memory: contains 4/8/16/32 Kbytes on-chip in-system reprogrammable flash memory for program storage. It is divided into two sections:
	-Boot Loader Section
	-Application Program Section

SRAM: for extended I/O space. There are 5 different addressing modes for the data memory:
	-Direct

	-Indirect

	-Indirect with Displacement

	-Indirect with Pre-Decrement

	-Indirect with Post-Increment

EEPROM Data Memory: organized as a separate data space in which single bytes can be read and written. EEPROM Access Registers are accessible in the I/O space

Processor Assembly Language
^^^^^^^^^^^^^^^^^^^^^^^^^^^

An entire instruction set summary is available (pg. 616) at: http://www.atmel.com/images/Atmel-8271-8-bit-AVR-Microcontroller-ATmega48A-48PA-88A-88PA-168A-168PA-328-328P_datasheet_Complete.pdf

---------------------------------
Arithmetic and Logic Instructions
---------------------------------

+-------------+------------+---------------------------------------------------+
|  Mnemonics  |  Operands  |                  Description                      |
+-------------+------------+---------------------------------------------------+
|     ADD     |   Rd, Rr   |                Add two registers                  |
+-------------+------------+---------------------------------------------------+
|    ADIW     |   Rdl, k   |              Add immediate to word                |
+-------------+------------+---------------------------------------------------+
|     SUB     |   Rd, Rr   |              Subtract two registers               |
+-------------+------------+---------------------------------------------------+
|    SUBI     |   Rd, k    |            Subtract constant from register        |
+-------------+------------+---------------------------------------------------+
|     AND     |   Rd, Rr   |              Logical AND registers                |
+-------------+------------+---------------------------------------------------+
|      OR     |   Rd, Rr   |              Logical OR registers                 |
+-------------+------------+---------------------------------------------------+
|     EOR     |   Rd, Rr   |              Exclusive OR registers               |
+-------------+------------+---------------------------------------------------+
|     INC     |     Rd     |                     Increment                     |
+-------------+------------+---------------------------------------------------+
|     DEC     |     Rd     |                     Decrement                     |
+-------------+------------+---------------------------------------------------+
|     MUL     |   Rd, Rr   |                  Multiply unsigned                |
+-------------+------------+---------------------------------------------------+

-------------------
Branch Instructions
-------------------

+-------------+------------+---------------------------------------------------+
|  Mnemonics  |  Operands  |                  Description                      |
+-------------+------------+---------------------------------------------------+
|     JMP     |      k     |                  Direct jump                      |
+-------------+------------+---------------------------------------------------+
|    CALL     |      k     |              Direct subroutine call               |
+-------------+------------+---------------------------------------------------+
|     RET     |            |                 Subroutine return                 |
+-------------+------------+---------------------------------------------------+
|      CP     |  Rd, Rr    |                      Compare                      |
+-------------+------------+---------------------------------------------------+

--------------------------
Data Transfer Instructions
--------------------------

+-------------+------------+---------------------------------------------------+
|  Mnemonics  |  Operands  |                  Description                      |
+-------------+------------+---------------------------------------------------+
|     MOV     |   Rd, Rr   |              Move between registers               |
+-------------+------------+---------------------------------------------------+

Sources:

*https://www.arduino.cc/ 

*https://en.wikipedia.org/wiki/Arduino

*http://www.atmel.com/images/Atmel-8271-8-bit-AVR-Microcontroller-ATmega48A-48PA-88A-88PA-168A-168PA-328-328P_datasheet_Complete.pdf
