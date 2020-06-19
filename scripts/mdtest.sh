#!/bin/bash


folder="$1"
mdlsdata=$( ls $folder | xargs -I{lin} echo \"$folder{lin}\" | xargs mdls )

echo "$mdlsdata"

