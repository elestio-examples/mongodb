#set env vars
set -o allexport; source .env; set +o allexport;

sed -i "s/INSTANCE_DOMAIN/$DOMAIN/g" ./scripts/mongo_setup.sh

sed -i "s/SOFTWARE_PASSWORD/$SOFTWARE_PASSWORD/g" ./scripts/mongo_setup.sh

#create key file (for cluster and single node cluster)
mkdir -p ./auth;
echo $(openssl rand -hex 20) > ./auth/key;


#activate the single node cluster and create admin account with mongosetup
docker-compose up -d;

#launch mongosetup a second time to ensure it's applied
docker-compose up mongosetup;
docker-compose up mongosetup

#add auth
sed -i 's|"--bind_ip_all"|"--auth", "--keyFile", "/auth/key", "--bind_ip_all"|g' docker-compose.yml

#stop the stack, will be restarted later with the auth added before
docker-compose down;