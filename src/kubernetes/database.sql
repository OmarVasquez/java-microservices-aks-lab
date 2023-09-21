MYSQL_SERVER_NAME=mysql-$APPNAME-$UNIQUEID
MYSQL_ADMIN_USERNAME=myadmin
MYSQL_ADMIN_PASSWORD=P2ssw0rd1234
DATABASE_NAME=petclinic
      
az mysql flexible-server create \
    --admin-user myadmin \
    --admin-password ${MYSQL_ADMIN_PASSWORD} \
    --name ${MYSQL_SERVER_NAME} \
    --resource-group ${RESOURCE_GROUP} 


 "connectionString": "mysql flexibleserverdb --host mysql-petclinic-fc1f27.mysql.database.azure.com --user myadmin --password=P2ssw0rd1234",

  az mysql flexible-server db create \
     --server-name $MYSQL_SERVER_NAME \
     --resource-group $RESOURCE_GROUP \
     -d $DATABASE_NAME


 az mysql flexible-server firewall-rule create \
     --rule-name allAzureIPs \
     --name ${MYSQL_SERVER_NAME} \
     --resource-group ${RESOURCE_GROUP} \
     --start-ip-address 0.0.0.0 --end-ip-address 0.0.0.0
