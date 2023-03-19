#add auth
echo "set auth activated"
sed -i 's|"--bind_ip_all"|"--auth", "--keyFile", "/auth/key", "--bind_ip_all"|g' docker-compose.yml

#stop the stack, will be restarted later with the auth added before
docker-compose down;
docker-compose up -d;