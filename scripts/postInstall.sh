#add auth

COMPOSE_FILE="docker-compose.yml"

if grep -q '"--auth", "--keyFile"' "$COMPOSE_FILE"; then
    echo "auth already activated"
else
    echo "set auth activated"
    sed -i 's|"--bind_ip_all"|"--auth", "--keyFile", "/auth/key", "--bind_ip_all"|g' docker-compose.yml
fi


#stop the stack, will be restarted later with the auth added before
docker-compose down;
docker-compose up -d;