
This directory contains a 32K ROM image `UE1TEST.ROM` that can be used
to test the functionality of the UE1-TTL computer.

There ROM can hold up to eight programs, that are selected using DIP
switches on the memory board:

* 0 - UE1FIBO - Calculates the Fibonacci sequence up to 21.
* 1 - UE1MATH - Performs addition and subtraction.
* 2 - UE1\_DIAPER1 - Tests the entire instruction set except input and output.
* 3 - UE1\_DIAPER2 - Tests input and output.
* 4 - MUL5X5 - Multiplies two 5-bit numbers to produce a 10-bit result.
* 5 - DIV8x4 - Divides an 8-bit number by a 4-bit number to give an 8-bit quotient and a 4-bit remainder.
* 6 - Unused, rings the bell and halts.
* 7 - Unused, rings the bell and halts.

The first two are by Usagi Electric.  The rest are by Rhys Weatherley.

The Python script `ue1-ttl-pack.py` packs eight program images into a
single 32K ROM image.  It can be used to create ROM images with new programs.
