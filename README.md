# wlshot
Simple screenshot utility for every possible wlr window manager or Desktop environment
------------------------------------------------------------------------------------------

## Desc
--------
im tired of using and combine grim and slurp and created own script 
that allow you use one simple command.
> ⚠ **WARNING:** This utility is currently in **pre-alpha**.  
> Use it at your own risk! The author takes no responsibility for any issues or damage caused.

--------


##Example options and usage:
------------------------------------------------------------------------------------------
first time its might look not easy to usage but veeery simple

```
shot [screen|region] wlrclipboard=[1|0]  
```

if you chose screen its capture screen output if region its capture selected space on 
screen, about wlrclipboard if you set that as 0 value its save the screenshot as .png file
if you set value as 1 autocopy to clipboard 

you can use: 
``` 
--help
``` 
as flag to get help message

# Install
if you want test that and use it in your best interest have installed grim,slurp,wl-clipboard

```
1) git clone https://github.com/binarylinuxx/wlshot.git
2) cd wlshot/
3) sudo make install/uninstall(if want uninstall)
```

# About sources
you can use precompiled binary package or compile with make if you want the new version as fast as possible
but if you want stable version in your best interest Download latest xbps pkg from github releases and install precompiled binary package placed
by **sudo xbps-install -R ~/Downloads/ wlshot **(work only for void and xbps based distributions) by the way issues opened to reports and suggestions
don't feel shy if have problem or suggestion

# maintainers
[void linux package myself](https://github.com/binarylinuxx)

arch linux package [Iwnuply](https://github.com/IwnuplyNotTyan)
