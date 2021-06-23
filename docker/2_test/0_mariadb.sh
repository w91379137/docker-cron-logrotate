
cname="test_mariadb"

docker rm -f ${cname}

docker run -d \
    --name ${cname} \
    -e TZ=Asia/Taipei \
    -e MYSQL_ROOT_PASSWORD=234567 \
    -e MYSQL_DATABASE=test \
    -e MYSQL_USER=yc \
    -e MYSQL_PASSWORD=123456 \
    -v $(pwd)/volume/conf.d:/etc/mysql/conf.d \
    -v $(pwd)/volume/log:/var/log/mysql \
    mariadb:10.5

# docker exec -it test_mariadb bash

