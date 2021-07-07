# EV21 Processor

RISC Processor called EV21 implemented it in Quartus for the Altera Cyclone IV FPGA. It runs over a 87.5 MHz base clock, has branch prediction algorithms and a 5 stage pipeline.

# Table of contents

* [Introduction](#Introduction)
* [Dataset](#Dataset)
* [Quick-Reference](#Quick-Reference)
* [Training](#Training)
* [Training](#training)
* [Contact](#Contact)
* [License](#License)

# Introduction
>[Table of contents](#table-of-contents)

In the world of processors, there is two main types of implementations that are currently running in modern day applications:

* CISC Processors (Complex Instruction Set Computer) That in short, have many intructions in its instruction set

* RISC Processors (Reduced Instruction Set Computer) That in the other hand, they are characterized for having a low amount of instructions to use.

In this work, we focused on implementing a RISC Processor that was capable of implementing a 5 stage pipeline. The main focus was to make the branch prediction algorithm for jumps in code, the most optimized possible. In the next section we will get into a little more detail on how this was implemented.


# Implementation
>[Table of contents](#table-of-contents)

To implement this processor we used the Altera Cyclone IV in the DE0 Nano FPGA Evaluation Board. To program this design we used Quartus as the main compilation and debugging program, and the code was written in Verilog.

The main structure of the Processor can be seen as follows:


![alt text](https://github.com/iancraz/EV1-Processor/blob/main/docs/Diagram.png?raw=true "Input")

Also, the Register Bank is implemented as:

![alt text](https://github.com/iancraz/EV1-Processor/blob/main/docs/Register_bank.png?raw=true "Input")

As you can see, it is separeted in different modules, that working together they implement the 5 stage pipeline, it cosists of:

`Fetch --> Decode --> Operand --> Execute --> Retire`

Each of this stages will be explained in the following sections.

## Fetch

## Decode

## Operand

## Execute

## Retire

# Instruction Set

The intruction set used for this Processor is as follows:

![alt text](https://github.com/iancraz/EV1-Processor/blob/main/docs/Instr_set.png?raw=true "Input")

You can see, that as many other RISC Processors, there are only two instructions for memory management, `MOM Y,W` and `MOM W,Y`.



If you prefer you can watch the complete epochs gif as follows:

<img src="https://github.com/iancraz/Pix2Pix-Image-Colorizer/blob/main/docs/Training_epochs.gif?raw=true" width=300 align=center>

# Contact
>[Table of contents](#table-of-contents)

Please do not hesitate to reach out to me if you find any issue with the code or if you have any questions.

* Personal email: [idiaz@itba.edu.ar](mailto:idiaz@itba.edu.ar)

* LinkedIn Profile: [https://www.linkedin.com/in/iancraz/](https://www.linkedin.com/in/iancraz/)

# License
>[Table of contents](#table-of-contents)

```
MIT License

Copyright (c) 2021 Ian Cruz Diaz

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```