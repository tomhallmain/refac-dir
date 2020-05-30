# Base remote sync actions for simple high-level syncs

#!/bin/bash
set -o pipefail
# shellcheck disable=SC1009
cd ~

# Handle option flags and set conditional variables

if (($# == 0)); then
  echo -e "Running remote sync push"
  REMOVE=false
fi

while getopts ":r" opt; do
  case $opt in
    a)
      echo -r "\nDanger - Remove option triggered: Files will be removed after remote sync"
      REMOVE=true
      ;;
    \?)
      echo -e "Invalid option: -$OPTARG \nValid options include -r" >&2
      exit 1
      ;;
  esac
done

if [ REMOVE=true ] ; then
  rsync -va "$1/" "$2/" --remove-source-files | grep
else
  rsync -va "$1/" "$2/" | grep
fi

