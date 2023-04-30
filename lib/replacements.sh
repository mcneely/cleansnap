
declare -A apps
apps=( ["firefox"]="installFirefox" )

replace () {
  if [ ${apps[$1]+x} ]; then
    echo "Installing Non-Snap $1";
    ${apps[$1]};
  fi
}


installFirefox () {
  if [ "$(getDistroPackageManager)" == "apt" ]; then
    DISTRO=$(getDistro);
    sudo cat << EOF | sudo /etc/apt/preferences.d/firefox.pref >/dev/null
Package: firefox*
Pin: release o=$DISTRO*
Pin-Priority: -1
EOF
sudo add-apt-repository ppa:mozillateam/ppa;
sudo apt update
sudo apt install firefox
  fi
}