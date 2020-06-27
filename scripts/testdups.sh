#!/bin/bash

FileList="${@:1}"
count=`printf "%s\n" $FileList | wc -l`
i=1
for file in $FileList; do
  samefiles=""
  let tailvalue=$count-$i
  filename=$(basename $file)
  samefiles=`echo "$FileList" | tail -n ${tailvalue} | grep $filename`
  
  printf "%s\n" "$FileList" | tail -n ${tailvalue}
  for samefile in $samefiles; do
    #we get md5sum of filename with same name
    msf=`md5sum $samefile`
    #we get md5sum of original file
    ms=`md5sum $file`
    if [ "$msf" == "$ms" ]; then
      echo "File $file duplicated to $samefile"
    fi
  done
  ((++i))
done



