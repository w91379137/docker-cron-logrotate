
cname="cronlogrotate"

docker rm -f ${cname}

docker run -it -d \
    --name ${cname} \
    -e TZ=Asia/Taipei \
    cronlogrotate:20210621_f

# docker exec -it cronlogrotate bash
