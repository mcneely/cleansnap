
lowercase(){
    sed -e "y/ABCDEFGHIJKLMNOPQRSTUVWXYZ/abcdefghijklmnopqrstuvwxyz/" <<< "$1"
}

getDistro () {
  local OS;
  local DISTRO;
  OS=$(lowercase "$OSTYPE");
  DISTRO=$(cat /etc/*-release | grep -w NAME | cut -d= -f2 | tr -d '"');
  if [ $DISTRO == "" ]; then
    DISTRO=$(cat /etc/*-release | grep -w ID | cut -d= -f2 | tr -d '"');
  fi
  if [ $DISTRO == "" ]; then
    DISTRO=$OS
  fi
  DISTRO=$(lowercase "$DISTRO");
  echo "$DISTRO";
}

getDistroPackageManager () {
  local DISTRO;
  DISTRO=$(getDistro);
  case "$DISTRO" in
    elementary|*mint|pop|*ubuntu|zorin)
          DISTRO="apt";
    ;;
  esac

  echo "$DISTRO";
}