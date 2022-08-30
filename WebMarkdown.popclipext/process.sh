#!/bin/bash

if [[ ! -e /usr/local/bin/gather ]]; then
	osascript download.applescript
	exit 1
fi

/usr/local/bin/gather --env POPCLIP_HTML --no-readability --html
