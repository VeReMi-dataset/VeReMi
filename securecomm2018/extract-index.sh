for item in `ls *tgz`
do
  tar --file "$item" --wildcards --no-anchored --extract *sca --strip-components=9 --one-top-level="tmp"

  SCA=`ls tmp/*sca`
  RUN="`echo "$SCA" | cut -d '#' -f2 | cut -d'.' -f1`"
  DENSITY="`echo "$SCA" | cut -d '=' -f2 | cut -d',' -f1`"
  ATTACKER="`echo "$SCA" | cut -d '-' -f1 | cut -d'e' -f'3-'`"
  ATTACK_DENSITY="`echo "$SCA" | cut -d '-' -f2 | cut -d',' -f2`"

  echo "| $RUN | $DENSITY | $ATTACKER | $ATTACK_DENSITY | [$item](securecomm2018/$item) |"

  rm -r tmp/
done
