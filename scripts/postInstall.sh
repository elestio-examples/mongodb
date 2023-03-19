#set env vars
set -o allexport; source .env; set +o allexport;

#launch mongosetup a second time to ensure it's applied
docker-compose up mongosetup;
docker-compose up mongosetup

#add auth
echo "set auth activated"
sed -i 's|"--bind_ip_all"|"--auth", "--keyFile", "/auth/key", "--bind_ip_all"|g' docker-compose.yml

#stop the stack, will be restarted later with the auth added before
docker-compose down;

docker-compose up -d;