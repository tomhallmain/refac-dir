#!/bin/bash

BASE_DIR=$(bash get_base_dir.sh)

# Handle option flags and set conditional variables

if (($# == 0)); then
  echo -e "Running remote sync"
  ALL=false
fi

while getopts ":rs:" opt; do
  case $opt in
    a)  echo -e "\nRemote sync running for all directory mappings"
        ALL='true' ;;
    s)  SEARCH="$OPTARG"
        echo -e "\nRemote sync running for directories matching ${SEARCH}" ;;
    \?) echo -e "Invalid option: -$OPTARG \nValid options include -as" >&2
        exit 1 ;;
  esac
done

if [ $ALL == 'true' ]; then
  db_sql_select_array map "*" \
    | sed -e "s/\|//g" \
    | xargs -n4 bash "${BASE_DIR}/scripts/rsync_base.sh"
elif [ ! -z $SEARCH ]; then
  db_sql_select_array map "*" "WHERE source ~ '${SEARCH}' OR target ~ '${SEARCH}'" \
    | sed -e "s/\|//g" \
    | xargs -n4 bash "${BASE_DIR}/scripts/rsync_base.sh"
fi

