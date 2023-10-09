#set env vars
set -o allexport; source .env; set +o allexport;

#save the latest dump to disk
docker-compose exec -T mongo sh -c "mongodump -u admin -p ${SOFTWARE_PASSWORD} --port 27017 --archive" > ./last.dump
