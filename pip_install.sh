if [ -f "/app/requirements.txt" ]
then
  echo "Python requirements.txt exists. Installing Python packages"
  pip install -r /app/requirements.txt
else
  echo "Python requirements.txt not exists. Skipping installing Python packages"
fi
