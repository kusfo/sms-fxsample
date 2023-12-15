# sms-fxsample
Small C/Asm library to reproduce sound samples on the Sega Master System.

## Intro
This is a small C wrapper for a ASM library that [Maxim](https://github.com/maxim-zhao) developed in order to reproduce high quality samples for the Sega Master System.

As the way it's implemented means almost all the CPU is used for playing the sample data, this is only suitable to be used on calm moments in the game (As the title screen, etc)

Maxim created several different implementations with different playback ratios, but the one used here is the one targetting 8.000 khz samples. 

## Usage
This library has been tested with [devkitSMS](https://github.com/sverx/devkitSMS) projects, but it should work with other frameworks.
Include the library in your project. You should initialise the sound chip to your expected parameters, and then call the `initPSG()` function. 
```
const unsigned char psgInit[] =
{
	0x9F, 0xBF, 0xDF, 0xFF, 0x81, 0x00, 0xA1, 0x00, 0xC1, 0x00, 0xE0
};
initPSG(psgInit);
```
And then, you can call the `playSample()` function with the pointer to the binary data of the sample:
```
PlaySample(your_sample);
```
There's a full example of sample playback in the example folder, contributed by MrBurrito :-)

## Converting Samples
Pcmenc should use the following command line arguments:
```
    pcmenc -rto 1 -dt1 12 -dt2 12 -dt3 423 file.wav
```
and optionally -r to split sample into blocks for rom replayer.

## Acknowledgments
Thanks to Maxim for the original ASM code, MrBurrito for the example code, Sverx for his wonderful work on devkitSMS and Calindro for the magnificent Sega Master System emulator Emulicious. 


