#!/bin/bash

input=$(cat)
cat <<EOF
$(pbpaste)
$input
EOF | pbcopy
