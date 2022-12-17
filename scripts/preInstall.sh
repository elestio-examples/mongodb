#set env vars
set -o allexport; source .env; set +o allexport;

sed -i "s/mongo:27017/$DOMAIN:27017/g" ./scripts/mongo_setup.sh

sed -i "s/[SOFTWARE_PASSWORD]/$SOFTWARE_PASSWORD/g" ./scripts/mongo_setup.sh

