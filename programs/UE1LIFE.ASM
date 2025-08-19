; ##############################################################################
;
; UE1 Conway's Game of Life
;
; Plays a linear version of Conway's game of life using bits 1-7 applying
; rule 110 (https://en.wikipedia.org/wiki/Rule_110), where for 3 bits ABC
; in the current generation the new value of B = B' is given by:
;
; A B C   B'
; 0 0 0   0
; 0 0 1   1
; 0 1 0   1
; 0 1 1   1
; 1 0 0   0
; 1 0 1   1
; 1 1 0   1
; 1 1 1   0
;
; At the edges of the playfield (i.e. bits 0 and 8) the values are assumed
; to be permanently 0.  This means on the left edge (bit 7) the B' must be
; B ^ C and on the right edge (bit 1) B' must be !(A & B)
;
; The initial playfield state is read from switches at start up. These values
; are copied into LED-1 through LED-7, and new generations are iteratively
; assessed.  At the end of each generation the bell is rung and processing
; is halted.  Restart processing to then assess the next generation.
;
; ##############################################################################



; ##############################################################################
; Initialization

; Modified by Rhys Weatherley.  The state of the SKIP register does not
; survive tape wrap-around on the UE1-TTL due to how the REWIND opcode works.
; We instead use SR0 as a flag.
;
; On the first loop, it is assumed that the RESET button has been
; pressed and SR0 is 0.  On subsequent loops, SR0 will be 1.
LD      SR0         ;   SR0 is 0 on the first loop and 1 on subsequent loops
NAND    RR
OEN     RR
IEN     RR

; Original code from decle:
;ONE     SR0         ; Enable initialisation for first iteration, will be skipped
;OEN     RR          ;   on subsequent loops
;IEN     RR          ;


; ##############################################################################
; Halt to read set switches, then read values into RAM / LEDs

NAND    RR          ; Invert RR
STO     OR0         ; Turn LED-0 off

LD      IR1         ; Copy switch 1 to RAM / LED
STO     SR1         ;
STO     OR1         ;
LD      IR2         ; Copy switch 2 to RAM / LED
STO     SR2         ;
STO     OR2         ;
LD      IR3         ; Copy switch 3 to RAM / LED
STO     SR3         ;
STO     OR3         ;
LD      IR4         ; Copy switch 4 to RAM / LED
STO     SR4         ;
STO     OR4         ;
LD      IR5         ; Copy switch 5 to RAM / LED
STO     SR5         ;
STO     OR5         ;
LD      IR6         ; Copy switch 6 to RAM / LED
STO     SR6         ;
STO     OR6         ;
LD      IR7         ; Copy switch 7 to RAM / LED
STO     SR7         ;
STO     OR7         ;


; ##############################################################################
; Main loop, enable inputs to start processing of the generation

ONE     SR0         ;
IEN     RR          ; Enable input
OEN     RR          ; Enable output


; ##############################################################################
; Process bit 1 - the right hand edge

LD      SR1         ; Load B
STO     SR0         ; Store B to RAM-0 for later

NAND    SR2         ; B' = !(B & A)
STO     SR1         ; Store B'
STO     OR1         ; Output B'

LD      SR0         ; Reload B
ADD     RR          ; Store B in carry as C for next eval


; ##############################################################################
; Process bit 2

LD      SR2         ; Load B
STO     SR0         ; Store B to RAM-0 for later
OEN     RR          ; If B = 1 next section evaluates B'

SKZ     RR          ; Skip if inactive to protect carry
ADD     RR          ; Retreive C from carry
NAND    SR3         ; B' = !(A & C)
STO     SR2         ; Store B'
STO     OR2         ; Output B'

LD      SR0         ; Reload B
NAND    RR          ; Invert B
OEN     RR          ; If !B = 1 next section evaluates B'

ADD     RR          ; Retreive C from carry
STO     SR2         ; Store B'
STO     OR2         ; Output B'

ONE     SR0         ; Enable output
OEN     RR          ;

LD      SR0         ; Reload B
ADD     RR          ; Store B in carry as C for next eval


; ##############################################################################
; Process bit 3

LD      SR3         ; Load B
STO     SR0         ; Store B to RAM-0 for later
OEN     RR          ; If B = 1 next section evaluates B'

SKZ     RR          ; Skip if inactive to protect carry
ADD     RR          ; Retreive C from carry
NAND    SR4         ; B' = !(A & C)
STO     SR3         ; Store B'
STO     OR3         ; Output B'

LD      SR0         ; Reload B
NAND    RR          ; Invert B
OEN     RR          ; If !B = 1 next section evaluates B'

ADD     RR          ; Retreive C from carry
STO     SR3         ; Store B'
STO     OR3         ; Output B'

ONE     SR0         ; Enable output
OEN     RR          ;

LD      SR0         ; Reload B
ADD     RR          ; Store B in carry as C for next eval


; ##############################################################################
; Process bit 4

LD      SR4         ; Load B
STO     SR0         ; Store B to RAM-0 for later
OEN     RR          ; If B = 1 next section evaluates B'

SKZ     RR          ; Skip if inactive to protect carry
ADD     RR          ; Retreive C from carry
NAND    SR5         ; B' = !(A & C)
STO     SR4         ; Store B'
STO     OR4         ; Output B'

LD      SR0         ; Reload B
NAND    RR          ; Invert B
OEN     RR          ; If !B = 1 next section evaluates B'

ADD     RR          ; Retreive C from carry
STO     SR4         ; Store B'
STO     OR4         ; Output B'

ONE     SR0         ; Enable output
OEN     RR          ;

LD      SR0         ; Reload B
ADD     RR          ; Store B in carry as C for next eval


; ##############################################################################
; Process bit 5

LD      SR5         ; Load B
STO     SR0         ; Store B to RAM-0 for later
OEN     RR          ; If B = 1 next section evaluates B'

SKZ     RR          ; Skip if inactive to protect carry
ADD     RR          ; Retreive C from carry
NAND    SR6         ; B' = !(A & C)
STO     SR5         ; Store B'
STO     OR5         ; Output B'

LD      SR0         ; Reload B
NAND    RR          ; Invert B
OEN     RR          ; If !B = 1 next section evaluates B'

ADD     RR          ; Retreive C from carry
STO     SR5         ; Store B'
STO     OR5         ; Output B'

ONE     SR0         ; Enable output
OEN     RR          ;

LD      SR0         ; Reload B
ADD     RR          ; Store B in carry as C for next eval


; ##############################################################################
; Process bit 6

LD      SR6         ; Load B
STO     SR0         ; Store B to RAM-0 for later
OEN     RR          ; If B = 1 next section evaluates B'

SKZ     RR          ; Skip if inactive to protect carry
ADD     RR          ; Retreive C from carry
NAND    SR7         ; B' = !(A & C)
STO     SR6         ; Store B'
STO     OR6         ; Output B'

LD      SR0         ; Reload B
NAND    RR          ; Invert B
OEN     RR          ; If !B = 1 next section evaluates B'

ADD     RR          ; Retreive C from carry
STO     SR6         ; Store B'
STO     OR6         ; Output B'

ONE     SR0         ; Enable output
OEN     RR          ;


; ##############################################################################
; Process bit 7 - the left hand edge

LD      SR0         ; Retreive C
XOR     SR7         ; B' = B ^ C
STO     SR7         ; Store B'
STO     OR7         ; Output B'


; ##############################################################################
; End of generation

; Disabled by Rhys Weatherley - run the generations continuously.
;IOC     SR0         ; Ring the bell
;NOPF    SR0         ; Wait


; ##############################################################################
; Setup to skip initialisation on next loop

; Modified by Rhys Weatherley.  Set SR0 to 1 for subsequent loops.
ONE     SR0
STO     SR0

; Original code from decle:
;ONE     SR0         ; RR = 0
;NAND    RR          ;
;SKZ     RR          ; Skip first instruction of the loop
