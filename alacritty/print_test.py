#!/usr/bin/python

for attr in ('', '1;', '2;', '3;', '4;', '5;', '6;', '7;'):
    for bgc in range(8):
        fgc = (bgc + 4) & 7
        print(f'\x1b[{attr}3{fgc};4{bgc}m TEXT ', end='')
    print('\x1b[0m')

