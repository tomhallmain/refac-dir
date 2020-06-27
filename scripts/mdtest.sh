#!/bin/bash


folder="$1"
mdlsdata=$(find "$folder" -type f | xargs -I % mdls "%")

echo "$mdlsdata"

