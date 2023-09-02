SWIFT_MODULE_SRC="Package/NewsApi2023(2.0)/Sources/NewsApi2023(2.0)/"

openapi-generator generate -i "newsapi.yaml" -g swift5 -o "api-mobile"

rm -r $SWIFT_MODULE_SRC""*
cp -R "api-mobile/OpenAPIClient/Classes/OpenAPIs/". $SWIFT_MODULE_SRC
rm -r "api-mobile"
