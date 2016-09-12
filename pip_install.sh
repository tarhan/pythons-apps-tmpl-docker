if [ -f "/app/requirements.txt" ]
then
  echo "Python requirements.txt exists. Installing Python packages"
  PACKAGES=`cat /app/requirements.txt | sed '/^\s*#/d;/^\s*$/d' | wc -l`
  echo "Found $PACKAGES packages. Installing them"
  if [ $PACKAGES -eq 0 ]; then
    echo "Skipping installing empty requirements"
  fi
  pip install -r /app/requirements.txt
else
  echo "Python requirements.txt not exists. Skipping installing Python packages"
fi
