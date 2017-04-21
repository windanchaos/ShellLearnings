#!/bin/bash

if [ ! -f "screenshot.png" ]; then
	wget www.robobunny.com/projects/asciiquarium/screenshot.png
fi

display screenshot.png 2> /dev/null &
