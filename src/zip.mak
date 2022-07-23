# Software License Agreement
# 
#     Copyright(C) 1994-2022 David Lindauer, (LADSoft)
# 
#     This file is part of the Orange C Compiler package.
# 
#     The Orange C Compiler package is free software: you can redistribute it and/or modify
#     it under the terms of the GNU General Public License as published by
#     the Free Software Foundation, either version 3 of the License, or
#     (at your option) any later version.
# 
#     The Orange C Compiler package is distributed in the hope that it will be useful,
#     but WITHOUT ANY WARRANTY; without even the implied warranty of
#     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#     GNU General Public License for more details.
# 
#     You should have received a copy of the GNU General Public License
#     along with Orange C.  If not, see <http://www.gnu.org/licenses/>.
# 
#     contact information:
#         email: TouchStone222@runbox.com <David Lindauer>
# 

ifneq "$(COMPILER)" "gcc-linux"
SHELL=cmd.exe
endif

ZIP:="c:/program files/7-zip/7z" -tzip -bd

OCC_VERSION := $(word 3, $(shell cmd /C type \orc\src\version.h))
OCC_VERSION := $(subst ",,$(OCC_VERSION))
export OCC_VERSION
VERNAME := $(subst .,,$(OCC_VERSION))

DISTEXE=/orc/dist/ZippedBinaries$(VERNAME).zip
DISTSRC=/orc/dist/ZippedSources$(VERNAME).zip

DISTRIBUTE:
	-del $(subst /,\,$(DISTEXE))
	-del $(subst /,\,$(DISTSRC))
	$(ZIP) -r0 a $(DISTEXE) orc/orc.exe orc/doc/*
	$(ZIP) a $(DISTEXE) orc/LICENSE.txt orc/copying
	$(ZIP) -r0 -xr@orc/src/xclude.lst a $(DISTSRC) orc/src/*.adl orc/src/*.cpp orc/src/*.c orc/src/*.h orc/src/*.nas orc/src/*.ase orc/src/*.asi orc/src/*.inc orc/src/*.p orc/src/*.rc orc/src/*.spc orc/src/*.app orc/src/*.cfg orc/src/makefile* orc/src/*.mak orc/src/*.txt orc/src/copying orc/src/*.def orc/src/*.lst 
	$(ZIP) a $(DISTSRC) orc/doc/*
	$(ZIP) -r0 a $(DISTSRC) orc/src/*.vcxproj orc/src/*.vcxproj.filters orc/src/*.sln
	$(ZIP) a $(DISTSRC) orc/src/*.exe orc/src/config.bat
	$(ZIP) a $(DISTSRC) orc/src/LICENSE.TXT
	$(ZIP) a $(DISTSRC) orc/src/copying