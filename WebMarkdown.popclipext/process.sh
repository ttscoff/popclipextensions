#!/bin/bash

GATHER=/usr/local/bin/gather
if [[ ! -e $GATHER ]]; then
	GATHER=/opt/homebrew/bin/gather
	if [[ ! -e $GATHER ]]; then
		osascript download.applescript
		exit 1
	fi
fi

$GATHER --env POPCLIP_HTML --no-readability --html
