# Base remote sync actions for simple high-level syncs

#!/bin/bash
set -o pipefail

SOURCE="$1"
TARGET="$2"
PERSIST_SOURCE="$3"
OVERWRITE="$4"

RSYNC_OPTS=''

echo "$1" "$2" "$3" "$4"

[ $PERSIST_SOURCE == 'f' ] && RSYNC_OPTS="--remove-source-files" \
  && echo "Removing source files" || echo "Preserving source files"

[ $OVERWRITE == 't' ] && RSYNC_OPTS="${RSYNC_OPTS} --delete-before" \
  && echo "Removing unmatched target files" || echo "Preserving target files"

rsync -a ${RSYNC_OPTS} "${SOURCE}" "${TARGET}"

