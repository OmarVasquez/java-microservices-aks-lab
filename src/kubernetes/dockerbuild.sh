cp ../spring-petclinic-api-gateway/target/spring-petclinic-api-gateway-$VERSION.jar spring-petclinic-api-gateway-$VERSION.jar
cp ../spring-petclinic-admin-server/target/spring-petclinic-admin-server-$VERSION.jar spring-petclinic-admin-server-$VERSION.jar
cp ../spring-petclinic-customers-service/target/spring-petclinic-customers-service-$VERSION.jar spring-petclinic-customers-service-$VERSION.jar
cp ../spring-petclinic-visits-service/target/spring-petclinic-visits-service-$VERSION.jar spring-petclinic-visits-service-$VERSION.jar
cp ../spring-petclinic-vets-service/target/spring-petclinic-vets-service-$VERSION.jar spring-petclinic-vets-service-$VERSION.jar
cp ../spring-petclinic-config-server/target/spring-petclinic-config-server-$VERSION.jar spring-petclinic-config-server-$VERSION.jar
cp ../spring-petclinic-discovery-server/target/spring-petclinic-discovery-server-$VERSION.jar spring-petclinic-discovery-server-$VERSION.jar


docker build -t $MYACR.azurecr.io/spring-petclinic-api-gateway:$VERSION \
    --build-arg ARTIFACT_NAME=spring-petclinic-api-gateway-$VERSION.jar \
    --build-arg APP_PORT=8080 \
    .

docker image list
   
docker push $MYACR.azurecr.io/spring-petclinic-api-gateway:$VERSION


az acr repository list \
   -n $MYACR


docker build -t $MYACR.azurecr.io/spring-petclinic-admin-server:$VERSION \
    --build-arg ARTIFACT_NAME=spring-petclinic-admin-server-$VERSION.jar \
    --build-arg APP_PORT=8080 \
    .
   
docker push $MYACR.azurecr.io/spring-petclinic-admin-server:$VERSION

docker build -t $MYACR.azurecr.io/spring-petclinic-customers-service:$VERSION \
    --build-arg ARTIFACT_NAME=spring-petclinic-customers-service-$VERSION.jar \
    --build-arg APP_PORT=8080 \
    .
   
docker push $MYACR.azurecr.io/spring-petclinic-customers-service:$VERSION

docker build -t $MYACR.azurecr.io/spring-petclinic-visits-service:$VERSION \
    --build-arg ARTIFACT_NAME=spring-petclinic-visits-service-$VERSION.jar \
    --build-arg APP_PORT=8080 \
    .
   
docker push $MYACR.azurecr.io/spring-petclinic-visits-service:$VERSION

docker build -t $MYACR.azurecr.io/spring-petclinic-vets-service:$VERSION \
    --build-arg ARTIFACT_NAME=spring-petclinic-vets-service-$VERSION.jar \
    --build-arg APP_PORT=8080 \
    .
docker push $MYACR.azurecr.io/spring-petclinic-vets-service:$VERSION


docker build -t $MYACR.azurecr.io/spring-petclinic-config-server:$VERSION \
    --build-arg ARTIFACT_NAME=spring-petclinic-config-server-$VERSION.jar \
    --build-arg APP_PORT=8888 \
    .
   
docker push $MYACR.azurecr.io/spring-petclinic-config-server:$VERSION


docker build -t $MYACR.azurecr.io/spring-petclinic-discovery-server:$VERSION \
    --build-arg ARTIFACT_NAME=spring-petclinic-discovery-server-$VERSION.jar \
    --build-arg APP_PORT=8761 \
    .
   
docker push $MYACR.azurecr.io/spring-petclinic-discovery-server:$VERSION


az acr repository list \
   -n $MYACR

az acr repository show-tags \
    -n $MYACR \
    --repository spring-petclinic-customers-service


