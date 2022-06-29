#save latest dump to disk
docker-compose exec -T mongo sh -c "mongodump -u admin -p [APP_PASSWORD] --port 27017 --archive" > ./last.dump
