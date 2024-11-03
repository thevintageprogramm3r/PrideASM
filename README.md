# PrideASM
PrideASM is a simple demo program that displays a Pride Flag at boot using VGA video mode 0x13.

![PrideASM](https://github.com/user-attachments/assets/11d07be2-5868-467c-aaae-95c8c53685b0)

## System Requirements 
- 386 Processor with 387 FPU or above
- VGA Display Adapter
- Legacy Boot

## Assembling and Making PrideASM Bootable
PrideASM was assembled using [Netwide Assembler](https://www.nasm.us/) on both Windows and Linux systems; be sure to set up this software first. To assemble pride.asm and get a disk image, use the command `nasm -f bin pride.asm -o pride.img`. Once done, it is possible to use dd to write it to physical media such as a USB flash drive or even a floppy disk. For use with a virtual machine instead, pride.img can be used just like any other floppy disk image.

## Credits and Resources
I want to highly recommend [Daedalus Community's series on building an x86 operating system](https://www.youtube.com/playlist?list=PLm3B56ql_akNcvH8vvJRYOc7TbYhRs19M), as that is where I found some useful information on setting up the bootloader and how to assemble the file to be used as a disk image (not to mention it serves as a great place to start off building an operating system). Another resource that proved to be a big help was [Ralph Brown's Interrupt List](http://www.ctyme.com/rbrown.htm) for a list of BIOS interrupts. Finally, the inspiration to do this came from [NCommander's video on making the Progress Flag in Windows 3.1](https://www.youtube.com/watch?v=vY-EM1IcZd8).
