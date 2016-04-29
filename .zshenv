echo "Loading ~/.zshenv"
#source ~/.zshrc

# If exit status of zeus is 2, restart
zeus () {
  ARGS=$@;
  command zeus "$@";
  ZE_EC=$?;
  if [ $ZE_EC = 2 ]; then
    stty sane;
    echo "Retrying zeus command"
    zeus ${=ARGS};
  fi
}

