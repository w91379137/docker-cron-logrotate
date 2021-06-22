
cname="cronlogrotate"

docker rm -f ${cname}

docker run -it -d \
    --name ${cname} \
    -e TZ=Asia/Taipei \
    -v $(pwd)/volume/log:/log \
    -v $(pwd)/volume/script:/script \
    -v $(pwd)/volume/timelog_rotate:/etc/logrotate.d/timelog_rotate \
    cronlogrotate:20210621 bash

# docker exec -it cronlogrotate bash
