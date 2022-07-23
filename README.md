ORC
=======

ORC resource compiler

Project Build Status:
[![Build status Appveyor](https://ci.appveyor.com/api/projects/status/4ts7bsgas67osyht?svg=true)](https://ci.appveyor.com/project/LADSoft/orangec)

ORC is a 32-bit resource compiler.   It is part of the [Orange C](https://www.github.com/LADSoft/OrangeC) toolchain.   

ORC takes a standard windows RC file, and produces a RES file.   Both the RC and RES files are in standard windows format, meaning ORC should process any standard resource file, and produce a RES file useable by most windows linkers.

Source Code for ORC is released under the GNU General Public License version 3.

The [Appveyor CI](https://ci.appveyor.com/project/LADSoft/ORC) project for this repository builds a setup file after each checkin.   It uses `omake` to do this.   The project can be built either by running omake, or by using the VS2019 solution which is included.

