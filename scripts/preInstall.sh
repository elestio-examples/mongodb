#set env vars
set -o allexport; source .env; set +o allexport;

sed -i "s/INSTANCE_DOMAIN/$DOMAIN/g" ./scripts/mongo_setup.sh

sed -i "s/SOFTWARE_PASSWORD/$SOFTWARE_PASSWORD/g" ./scripts/mongo_setup.sh

#create key file (for cluster and single node cluster)
echo "Create Key file"
mkdir -p ./auth;
echo $(openssl rand -hex 20) > ./auth/key;

echo "set perm on Key file"
chmod 600 ./auth/key 

