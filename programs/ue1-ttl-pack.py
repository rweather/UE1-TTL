#!/usr/bin/python3
#
# Usage: ue1-ttl-pack.py output.rom program1 program2 ... program8
#

import sys

if len(sys.argv) < 3:
    print("Usage: ue1-ttl-pack.py output.rom program1 program2 ... program8")
    sys.exit(1)

arg = 2
posn = 0

with open(sys.argv[1], 'wb') as outfile:
    while posn < 8:
        with open(sys.argv[arg], 'rb') as infile:
            data = infile.read()
            # Output two "NOP0 SR0" instructions at the start in case the
            # skip register is set.  This will clear it.  There is also a
            # bug in the clock circuit that can cause PC to double-increment
            # when resuming after a halt instruction.
            outfile.write(bytearray([0, 0]))
            size = 2
            # Output the contents of the file.
            prev_was_skz = False
            prev_prev_was_skz = False
            for i in data:
                inst = int(i)
                if (inst & 0xF0) == 0xE0 or (inst & 0xF0) == 0xD0:
                    # "SKZ" or "RTN" instruction.
                    prev_prev_was_skz = False
                    prev_was_skz = True
                    outfile.write(bytearray([inst]))
                    size = size + 1
                elif prev_prev_was_skz and (inst & 0x0F) >= 0x08:
                    # There is a bug with the rewind logic on the board that
                    # causes a false rewind two instructions after a taken
                    # "SKZ" if the memory address has bit 3 set.  To work
                    # around this, insert an extra "NOP0 SR0" / 0x00 instruction.
                    # "RTN" is a skip that is always taken, so handle that too.
                    prev_prev_was_skz = False
                    if (inst & 0xF0) == 0xE0 or (inst & 0xF0) == 0xD0:
                        # Cascading skips.
                        prev_was_skz = True
                    else:
                        prev_was_skz = False
                    outfile.write(bytearray([0]))
                    outfile.write(bytearray([inst]))
                    size = size + 2
                elif (inst & 0xF0) == 0 and (inst & 0x0F) >= 0x08:
                    # "NOP0" instruction that may be misinterpreted as a rewind.
                    # Convert it into "NOP0 SR0" to stop the rewind occurring.
                    prev_prev_was_skz = prev_was_skz
                    prev_was_skz = False
                    outfile.write(bytearray([0]))
                    size = size + 1
                else:
                    prev_prev_was_skz = prev_was_skz
                    prev_was_skz = False
                    outfile.write(bytearray([inst]))
                    size = size + 1
            # Check the maximum size of the program.
            if size > 4096:
                print("%s is too large" % sys.argv[arg])
                sys.exit(1)
            # Pad the rest of the image with "NOP0 RR" instructions to rewind.
            count = 4096 - size
            while count > 0:
                outfile.write(bytearray([8]))
                count = count - 1
        arg = arg + 1
        if arg >= len(sys.argv):
            arg = 2
        posn = posn + 1

sys.exit(0)
