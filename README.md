# vim-unite-cscope

Uniting cscope with vim
This is a package similar to my other package (https://www.github.com/amitab/atom-cscope)

PS: I just learnt vim scripting recently and there may be mistakes/better way of doing things. If you find any problems, please let me know.

## What it does?

1.  Find this C symbol:                         ✓
2.  Find this global definition:                ✓
3.  Find functions called by this function:     ✓
4.  Find functions calling this function:       ✓
5.  Find this text string:                      ✓
6.  Change this text string:                    ✗
7.  Find this egrep pattern:                    ✓
8.  Find this file:                             ✓
9.  Find files #including this file:            ✓
10. Find assignments to this symbol:            ✓

## Set it up?

To generate cscope.out manually, in your project directory run:
```bash
find . -name "*.c" -o -name "*.cpp" -o -name "*.h" -o -name "*.hpp" > cscope.files
cscope -q -R -b -i cscope.files
```
And then the package will be able to use the cscope.out file to generate results.

## Screenshots
![ScreenShot](http://i.imgur.com/iJEkM4k.png)

## Further Improvements?
1. Add 'Change this text string' functionality
