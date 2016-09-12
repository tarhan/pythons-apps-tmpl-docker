echo "Entering /prepare_alpine.sh"

if [ ! -f "/app/app.yaml" ]
then
  echo "app.yaml not exists. Skipping OS packages installation"
  exit 0
fi

RT_LIST_TYPE=`cat /app/app.yaml | shyaml get-type dependencies.alpine.runtime "{}"`

if [ "$RT_LIST_TYPE" == "sequence" ]; then
  echo "Found runtime dependencies. Installing packages..."
  # We found that app.yaml contains alpine_runtime_dependencies so we can process it
  RT_LIST=`cat /app/app.yaml | shyaml get-values dependencies.alpine.runtime | tr '\n' ' '`
  # Extract list of packages and convert it into list devided by space.
  apk add --no-cache $RT_LIST
  # Installing packages
fi

BLD_LIST_TYPE=`cat /app/app.yaml | shyaml get-type dependencies.alpine.buildtime "{}"`

if [ "$BLD_LIST_TYPE" == "sequence" ]; then
  echo "Found buildtime dependencies. Installing packages..."
  # We found that app.yaml contains alpine_runtime_dependencies so we can process it
  BLD_LIST=`cat /app/app.yaml | shyaml get-values dependencies.alpine.buildtime | tr '\n' ' '`
  # Extract list of packages and convert it into list devided by space.
  apk add --no-cache --virtual build-dependencies build-base cmake $BLD_LIST
fi
