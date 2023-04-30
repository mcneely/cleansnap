
declare -A apps
apps=( ["firefox"]="prepareFirefox" )

prepare () {
  if [ ${apps[$1]+x} ]; then
    echo "Running $1 prepare script.";
    ${apps[$1]};
  fi
}

prepareFirefox () {
    sudo systemctl stop var-snap-firefox-common-host\\x2dhunspell.mount;
    sudo systemctl disable var-snap-firefox-common-host\\x2dhunspell.mount;
}