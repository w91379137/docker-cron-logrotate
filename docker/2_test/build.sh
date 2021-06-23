
IMAGEREPO="cronlogrotate"
IMAGETAG="${IMAGEREPO}:20210621_f"

docker build --no-cache -t ${IMAGETAG} .

docker images | grep ${IMAGEREPO}