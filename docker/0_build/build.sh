
IMAGEREPO="cronlogrotate"
IMAGETAG="${IMAGEREPO}:20210621"

CMD="docker images -q ${IMAGETAG}"
HASH=$(${CMD} 2> /dev/null)

if [ "$HASH" != "" ];
then
  echo '█ exist image'
else  
  echo '█ no image, build now'
  docker build --no-cache -t ${IMAGETAG} .
fi

docker images | grep ${IMAGEREPO}