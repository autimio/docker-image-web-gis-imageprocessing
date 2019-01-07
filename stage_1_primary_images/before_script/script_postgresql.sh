export BUILD_DATE=$(date '+%d/%m/%Y %T UTC' -u)
docker pull $USERNAME/$CONTAINER_IMAGE_3:latest || true