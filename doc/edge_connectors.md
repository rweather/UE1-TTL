Signals on the Edge Connectors
==============================

The signals on the edge connectors are mostly passed as-is through to
each board.  There are some exceptions on the left-hand side of the
clock board and on the right-hand side of the memory board.

In the table below, "A/B" indicates that the pin has function "A" on
the left-hand side of a board and function "B" on the right-hand
side of a board.  "NC" indicates "not connected".

<table border="1">
<tr><td><b>Pin</b></td><td><b>Clock</b></td><td><b>Processor</b></td><td><b>Memory</b></td><td><b>Description</b></td></tr>
<tr><td>1</td><td>5V</td><td>5V</td><td>5V</td><td>Power</td></tr>
<tr><td>2</td><td>GND</td><td>GND</td><td>GND</td><td>Ground</td></tr>
<tr><td>3</td><td>D0</td><td>D0</td><td>D0/OR0</td><td>Bit 0 of the unbuffered tape instruction, or output register bit 0</td></tr>
<tr><td>4</td><td>D1</td><td>D1</td><td>D1/OR0</td><td>Bit 1 of the unbuffered tape instruction, or output register bit 1</td></tr>
<tr><td>5</td><td>D2</td><td>D2</td><td>D2/OR0</td><td>Bit 2 of the unbuffered tape instruction, or output register bit 2</td></tr>
<tr><td>6</td><td>D3</td><td>D3</td><td>D3/OR0</td><td>Bit 3 of the unbuffered tape instruction, or output register bit 3</td></tr>
<tr><td>7</td><td>D4</td><td>D4</td><td>D4/OR0</td><td>Bit 4 of the unbuffered tape instruction, or output register bit 4</td></tr>
<tr><td>8</td><td>D5</td><td>D5</td><td>D5/OR0</td><td>Bit 5 of the unbuffered tape instruction, or output register bit 5</td></tr>
<tr><td>9</td><td>D6</td><td>D6</td><td>D6/OR0</td><td>Bit 6 of the unbuffered tape instruction, or output register bit 6</td></tr>
<tr><td>10</td><td>D7</td><td>D7</td><td>D7/OR0</td><td>Bit 7 of the unbuffered tape instruction, or output register bit 7</td></tr>
<tr><td>11</td><td>MEM0</td><td>MEM0</td><td>MEM0/NC</td><td>Bit 0 of the buffered memory address</td></tr>
<tr><td>12</td><td>MEM1</td><td>MEM1</td><td>MEM1/IR1</td><td>Bit 1 of the buffered memory address, or input register bit 1</td></tr>
<tr><td>13</td><td>MEM2</td><td>MEM2</td><td>MEM2/IR2</td><td>Bit 2 of the buffered memory address, or input register bit 2</td></tr>
<tr><td>14</td><td>MEM3</td><td>MEM3</td><td>MEM3/IR3</td><td>Bit 3 of the buffered memory address, or input register bit 3</td></tr>
<tr><td>15</td><td>INST0</td><td>INST0</td><td>NC/IR4</td><td>Bit 0 of the buffered instruction opcode, or input register bit 4</td></tr>
<tr><td>16</td><td>INST1</td><td>INST1</td><td>NC/IR5</td><td>Bit 1 of the buffered instruction opcode, or input register bit 5</td></tr>
<tr><td>17</td><td>INST2</td><td>INST2</td><td>NC/IR6</td><td>Bit 2 of the buffered instruction opcode, or input register bit 6</td></tr>
<tr><td>18</td><td>INST3</td><td>INST3</td><td>NC/IR7</td><td>Bit 3 of the buffered instruction opcode, or input register bit 7</td></tr>
<tr><td>19</td><td>RD_DATA</td><td>RD_DATA</td><td>RD_DATA</td><td>Read data line, output from memory, input to processor</td></tr>
<tr><td>20</td><td>WR_DATA</td><td>WR_DATA</td><td>WR_DATA</td><td>Write data line, output from processor, input to memory</td></tr>
<tr><td>21</td><td>WRITE</td><td>WRITE</td><td>WRITE</td><td>Write control signal to memory, latch on falling edge</td></tr>
<tr><td>22</td><td>RR</td><td>RR</td><td>RR</td><td>State of the result register RR</td></tr>
<tr><td>23</td><td>CAR</td><td>CAR</td><td>CAR</td><td>State of the carry register CAR</td></tr>
<tr><td>24</td><td>IEN</td><td>IEN</td><td>IEN</td><td>State of the input enable register IEN</td></tr>
<tr><td>25</td><td>OEN</td><td>OEN</td><td>OEN</td><td>State of the output enable register OEN</td></tr>
<tr><td>26</td><td>OP_NOP0</td><td>OP_NOP0</td><td>OP_NOP0</td><td>Low when a NOP0 instruction is being executed</td></tr>
<tr><td>27</td><td>OP_NOPF</td><td>OP_NOPF</td><td>OP_NOPF</td><td>Low when a NOPF/HLT instruction is being executed</td></tr>
<tr><td>28</td><td>OP_IOC</td><td>OP_IOC</td><td>OP_IOC</td><td>Low when a IOC/BEL instruction is being executed</td></tr>
<tr><td>29</td><td>OP_RTN</td><td>OP_RTN</td><td>OP_RTN</td><td>Low when a RTN instruction is being executed</td></tr>
<tr><td>30</td><td>HALTED/REWIND</td><td>REWIND</td><td>REWIND</td><td>High when a rewind instruction is being executed, or the active-low halt signal on the left-hand side of the clock board</td></tr>
<tr><td>31</td><td>EXT_CLK/SPARE</td><td>SPARE</td><td>SPARE</td><td>Spare signal that is passed to all boards, or the external clock on the left-hand side of the clock board</td></tr>
<tr><td>32</td><td>CLK1</td><td>CLK1</td><td>CLK1</td><td>CLK1 pulse for the two-phase clock</td></tr>
<tr><td>33</td><td>CLK2</td><td>CLK2</td><td>CLK2</td><td>CLK2 pulse for the two-phase clock</td></tr>
<tr><td>34</td><td>RESET</td><td>RESET</td><td>RESET</td><td>Active-low signal to reset the system</td></tr>
<tr><td>35</td><td>GND</td><td>GND</td><td>GND</td><td>Ground</td></tr>
<tr><td>36</td><td>5V</td><td>5V</td><td>5V</td><td>Power</td></tr>
</table>
