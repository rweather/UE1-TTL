#!/usr/bin/python3

#
# The display should be wired up as follows:
#
#       Display     UE1-TTL
#       VCC         5V
#       GND         GND
#       DIN         OR0
#       CS          OR1
#       CLK         OR2
#

# Initialize the machine.
print('; Generated automatically by "rabbit-gen.py"')
print("ONE  SR0")
print("IEN  RR")
print("OEN  RR")

# Set the initial state of the control lines.
print("STOC OR0")   # DIN = 0
print("STO  OR1")   # CS  = 1
print("STOC OR2")   # CLK = 0
din = 0

# Output a command to the display.
def cmd(value):
    global din
    print("; Command 0x%04X" % value)
    print("STOC OR1") # Lower CS
    bit = 32768
    while bit > 0:
        # Bits 12..15 of the command are "don't care" bits, so there
        # is no point changing the DIN value while doing those bits.
        # Saves a few instructions here and there between commands.
        if bit < 4096:
            if (value & bit) != 0:
                if din != 1:
                    print("STO  OR0")
                din = 1
            else:
                if din != 0:
                    print("STOC OR0")
                din = 0
        print("STO  OR2") # Toggle CLK
        print("STOC OR2")
        bit = bit >> 1
    print("STO  OR1") # Raise CS

# Initialize the display.
cmd(0x0C01)     # Activate normal mode.
cmd(0x0F00)     # Turn off test mode.
cmd(0x0900)     # Turn off BCD decode mode.
cmd(0x0B07)     # Scan all "digits" on the display.
cmd(0x0800)     # Clear the entire display.
cmd(0x0700)
cmd(0x0600)
cmd(0x0500)
cmd(0x0400)
cmd(0x0300)
cmd(0x0200)
cmd(0x0100)

# Message to scroll.
message = [
    ".................................................",
    ".................................................",
    ".....#..#.###.#...#....##..###..#...###..........",
    ".....#..#.#...#...#...#..#.#..#.#...#..#.........",
    ".....####.###.#...#...#..#.###..#...#..#.........",
    ".....#..#.#...#...#...#..#.#..#.#...#..#.........",
    ".....#..#.###.###.###..##..#..#.###.###..........",
    "................................................."
]

# Scroll the message.
def draw(line, data):
    bits = 0
    for bit in range(0,8):
        if data[bit] == '#':
            bits = bits | (1 << bit)
    cmd(line * 256 + bits)
x = 0
while x <= (len(message[0]) - 8):
    draw(6, message[2][x:])
    draw(5, message[3][x:])
    draw(4, message[4][x:])
    draw(3, message[5][x:])
    draw(2, message[6][x:])
    x = x + 3

# Draw a rabbit.
cmd(0x086C)
cmd(0x076C)
cmd(0x067C)
cmd(0x0582)
cmd(0x04AA)
cmd(0x0382)
cmd(0x0292)
cmd(0x017C)

# Bell and Halt.
print("IOC  SR0")
print("NOPF SR0")
