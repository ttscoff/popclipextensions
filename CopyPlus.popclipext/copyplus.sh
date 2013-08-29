#!/bin/bash

clipboard=`__CF_USER_TEXT_ENCODING=$UID:0x8000100:0x8000100 pbpaste`

# Check for command key
if [[ $POPCLIP_MODIFIER_FLAGS == 1048576 ]]; then
	__CF_USER_TEXT_ENCODING=$UID:0x8000100:0x8000100 pbcopy <<EOF
$clipboard

$POPCLIP_TEXT
EOF
else
	__CF_USER_TEXT_ENCODING=$UID:0x8000100:0x8000100 pbcopy <<EOF
$clipboard
$POPCLIP_TEXT
EOF
fi
