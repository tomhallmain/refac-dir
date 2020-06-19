#!/bin/bash
FILE=$1
EXT=${FILE##*.}

SIZE=$(stat -c "%s" "$FILE")
echo "$FILE: $EXT $SIZE"
