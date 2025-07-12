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
            if len(data) >= 4092:
                print("%s is too large" % sys.argv[arg])
                sys.exit(1)
            # Output some "NOP0 SR0" instructions at the start.
            outfile.write(bytearray([0, 0]))
            # Output the contents of the file.
            outfile.write(data)
            # Pad the rest of the image with "NOP0 RR" instructions to rewind.
            count = 4094 - len(data)
            while count > 0:
                outfile.write(bytearray([8]))
                count = count - 1
        arg = arg + 1
        if arg >= len(sys.argv):
            arg = 2
        posn = posn + 1

sys.exit(0)
