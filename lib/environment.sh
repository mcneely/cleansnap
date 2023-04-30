
function isGnome()
{
    ps -e | grep -E '^.* gnome-session' > /dev/null
    if [ $? -eq 0 ];
    then
      echo "1";
    else
      echo "0";
    fi
}
