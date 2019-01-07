export BUILD_DATE=$(date '+%d/%m/%Y %T UTC' -u)
docker pull $USERNAME/$CONTAINER_IMAGE_2:latest || true

build --cache-from $USERNAME/$CONTAINER_IMAGE_2:latest --build-arg BUILD_DATE="${BUILD_DATE}" --build-arg TRAVIS_COMMIT="${TRAVIS_COMMIT}" --tag $USERNAME/$CONTAINER_IMAGE_2:$TRAVIS_COMMIT --tag $USERNAME/$CONTAINER_IMAGE_2:latest -f stage_1_primary_images/Dockerfile.grass .

docker images
echo $PASSWORD | docker login -u $USERNAME --password-stdin
docker push $USERNAME/$CONTAINER_IMAGE_2:$TRAVIS_COMMIT && docker push $USERNAME/$CONTAINER_IMAGE_2:latest