#!/bin/bash
mkdir -p "$HOME/.local/share/fonts"
export SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"

reload_fonts=false
cd $SCRIPTPATH

# check that every font in this directory is installed 
# if not copy it to the local font path
for f in *.ttf
do 
  font="${HOME}/.local/share/fonts/${f}"
  if ! test -f "$font"; then
    echo "$font needs install."
    cp "$f" "$font"
    reload_fonts=true
  fi
done


# if any font is installed update the cache
if $reload_fonts
then
  fc-cache -f -v
fi
