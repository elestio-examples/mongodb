#Restart the stack after files are restored
docker-compose up -d;
sleep 5s;

#set env vars
set -o allexport; source .env; set +o allexport;

#restore from the last dump
docker-compose exec -T mongo sh -c "mongorestore -u admin -p ${SOFTWARE_PASSWORD} --port 27017 --archive" < ./last.dump
