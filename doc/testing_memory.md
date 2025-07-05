Assembling and Testing the Memory and I/O Board
===============================================

<a href="../images/memory-board.jpg"><img src="../images/memory-board.jpg" width="500"/></a>

## Parts

* 1 x AT28C256 32K x 8 EEPROM
* 1 x 74LS32 quad OR gate
* 1 x 74LS139 dual 2-to-4 line decoder
* 2 x 74LS251 8-line to 1-line multiplexer
* 2 x 74LS259 8-bit addressable latch
* 2 x 74LS393 dual binary 4-bit counter
* 9 x 100nF ceramic or monolithic capacitor
* 1 x 10K resistor
* 10 x 100K resistor
* 8 x RLED resistor (choose to suit the properties of the LED's)
* 8 x 3mm LED (colour of your choice)
* 1 x 8-way DIP switches
* 1 x 3-way DIP switches
* 2 x 36-pin right-angle terminal header
* 3 x 14-pin DIP socket
* 5 x 16-pin DIP socket
* 1 x 28-pin DIP socket (15.24mm pitch width)

The IC's are listed as 74LS series, but you can use 74HC series instead.
Use the same series for all chips.

I recommend using a socket for the 28-pin EEPROM even if you don't use
sockets for the other chips.  You will need to easily remove the EEPROM to
reprogram it.

## Assembling

Start in the usual way with the low profile components and work up in height:

* Resistors
* Pin headers along the left and right edges
* LED's
* IC sockets
* Capacitors, which are all 100nF
* DIP switches

Do a quick test with a multimeter to make sure there is no short
between 5V and ground.  Then insert the IC's into the sockets:

* U1 - 74LS139
* U2 - 74LS259
* U3 - 74LS251
* U4 - 74LS251
* U5 - 74LS259
* U6 - 74LS393
* U7 - 74LS393
* U8 - 73LS32
* U9 - AT28C256

## Testing

TBD
