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




# Quick Reference
>[Table of contents](#table-of-contents)

To run this example, you need to clone this repository:

```
git clone https://github.com/iancraz/Pix2Pix-Image-Colorizer.git
```

After you have cloned this repository you need to create the directories `./Dataset/train/` and `./checkpoints/`, once you created this directories you can download this pretrained model so as not to have to retrain the model. The link to the checkpoint is:

[Checkpoint](https://drive.google.com/file/d/10uJ-W6xV7viHc0UWiHsMUY4xFCFt4Ab5/view?usp=sharing)

[Checkpoint Index](https://drive.google.com/file/d/10xVxfjFAN9A9nUKLIAe_3dh6yIP0_9Mw/view?usp=sharing)

Once you have downloaded this checkpoints you must save them in the `./checkpoints/` folder.

Now you are ready to test this model, you must run all the Jupyter Notebook (Remember to update the paths in the file so that it matches your computer), and the model should run smoothly. 

If you don't want to reatrain your model and prefer to use the pretrained one you **MUST NOT** run the cell:

```Python
train(train_dataset, 100)
```

You can test the model with the function:

```Python
generate_images(model, test_input, tar, save_filename=False, display_imgs=True)
```

# Training
>[Table of contents](#table-of-contents)

The training was done in 25 epochs whit 32 long batchsizes, the results are shown as follows:

Input Image:

![alt text](https://github.com/iancraz/Pix2Pix-Image-Colorizer/blob/main/docs/input.jpg?raw=true "Input")

Target Image:

![alt text](https://github.com/iancraz/Pix2Pix-Image-Colorizer/blob/main/docs/target.jpg?raw=true "Target")

Epoch 1:

<img src="https://github.com/iancraz/Pix2Pix-Image-Colorizer/blob/main/docs/0_0.jpg?raw=true" width=300 align=center>

Epoch 5:

<img src="https://github.com/iancraz/Pix2Pix-Image-Colorizer/blob/main/docs/0_5.jpg?raw=true" width=300 align=center>

Epoch 10:

<img src="https://github.com/iancraz/Pix2Pix-Image-Colorizer/blob/main/docs/0_10.jpg?raw=true" width=300 align=center>

Epoch 15:

<img src="https://github.com/iancraz/Pix2Pix-Image-Colorizer/blob/main/docs/0_15.jpg?raw=true" width=300 align=center>

Epoch 20:

<img src="https://github.com/iancraz/Pix2Pix-Image-Colorizer/blob/main/docs/0_20.jpg?raw=true" width=300 align=center>


Epoch 25:

<img src="https://github.com/iancraz/Pix2Pix-Image-Colorizer/blob/main/docs/0_25.jpg?raw=true" width=300 align=center>

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