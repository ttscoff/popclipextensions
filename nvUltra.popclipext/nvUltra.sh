nb=$POPCLIP_OPTION_POPMAKEROPTPREFIX
notebook=""

[[ "$nb" != "" ]] && notebook="&notebook=$nb"
open "x-nvultra://make/?txt=${POPCLIP_TEXT}${notebook}"
