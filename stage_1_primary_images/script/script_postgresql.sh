export BUILD_DATE=$(date '+%d/%m/%Y %T UTC' -u)
docker pull $USERNAME/$CONTAINER_IMAGE_3:latest || true

docker build --cache-from $USERNAME/$CONTAINER_IMAGE_3:latest --build-arg BUILD_DATE="${BUILD_DATE}" --build-arg TRAVIS_COMMIT="${TRAVIS_COMMIT}" --tag $USERNAME/$CONTAINER_IMAGE_3:$TRAVIS_COMMIT --tag $USERNAME/$CONTAINER_IMAGE_3:latest -f Dockerfile.postgresql .

docker images
echo $PASSWORD | docker login -u $USERNAME --password-stdin
docker push $USERNAME/$CONTAINER_IMAGE_3:$TRAVIS_COMMIT && docker push $USERNAME/$CONTAINER_IMAGE_3:latest