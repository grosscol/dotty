if [ -z ${1} ];
then
  echo "Invalid use.";
  echo "Needs username as argument: ./filluser.sh username";
  exit
fi

sed -i -- 's/yerusername/'${1}'/g' bashrc
sed -i -- 's/yerusername/'${1}'/g' .gitconfig
