echo $PASSWORD | docker login -u $USERNAME --password-stdin

docker build --cache-from $USERNAME/$CONTAINER_IMAGE_1:latest --build-arg BUILD_DATE="${BUILD_DATE}" --build-arg TRAVIS_COMMIT="${TRAVIS_COMMIT}" --tag $USERNAME/$CONTAINER_IMAGE_1:$TRAVIS_COMMIT --tag $USERNAME/$CONTAINER_IMAGE_1:latest -f Dockerfile.gdal .

docker images

export BUILD_DATE=$(date '+%d/%m/%Y %T UTC' -u)

docker pull $USERNAME/$CONTAINER_IMAGE_1:latest || true

docker push $USERNAME/$CONTAINER_IMAGE_1:$TRAVIS_COMMIT && docker push $USERNAME/$CONTAINER_IMAGE_1:latest