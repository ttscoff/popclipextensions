#!/bin/bash

clipboard=`__CF_USER_TEXT_ENCODING=$UID:0x8000100:0x8000100 pbpaste`

# Check for command key
if [[ $POPCLIP_MODIFIER_FLAGS == 1048576 ]]; then
	__CF_USER_TEXT_ENCODING=$UID:0x8000100:0x8000100 pbcopy <<EOS
$clipboard

$POPCLIP_TEXT
EOS
# check for option key, append with no spaces or line break
elif [[ $POPCLIP_MODIFIER_FLAGS == 524288 ]]; then
	__CF_USER_TEXT_ENCODING=$UID:0x8000100:0x8000100 pbcopy << "$clipboard$POPCLIP_TEXT"
else
	__CF_USER_TEXT_ENCODING=$UID:0x8000100:0x8000100 pbcopy <<EOS
$clipboard
$POPCLIP_TEXT
EOS
fi
