#set env vars
set -o allexport; source .env; set +o allexport;

sed -i "s/INSTANCE_DOMAIN/$DOMAIN/g" ./scripts/mongo_setup.sh

sed -i "s/SOFTWARE_PASSWORD/$SOFTWARE_PASSWORD/g" ./scripts/mongo_setup.sh

