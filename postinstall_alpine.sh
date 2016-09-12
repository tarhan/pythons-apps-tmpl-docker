echo "Entering /postinstall_alpine.sh"

apk info build-dependencies
STATUS=$?

if [ $STATUS -eq 0 ]; then
  echo "Build dependencies were installed. Removing them."
  apk del build-dependencies
fi
