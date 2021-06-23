
cname="test_logrotate"

docker rm -f ${cname}

docker run -it -d \
    --name ${cname} \
    -e TZ=Asia/Taipei \
    -e MYSQL_ROOT_PASSWORD=234567 \
    -e MYSQL_DATABASE=test \
    -e MYSQL_USER=yc \
    -e MYSQL_PASSWORD=123456 \
    -v $(pwd)/volume/log:/log \
    -v $(pwd)/volume/script:/script \
    mariadb_log:20210613 /script/start.sh

docker network connect myNetwork ${cname}
# docker exec -it test_logrotate bash