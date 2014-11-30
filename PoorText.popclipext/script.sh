#!/bin/bash

logger "$POPCLIP_TEXT"

echo -n "$POPCLIP_TEXT"|pbcopy|pbpaste

logger $?
