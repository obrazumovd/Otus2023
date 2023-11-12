SWIFT_MODULE_SRC="Package/OtusHwPackage/Sources/NewsApi2023/"

openapi-generator generate -i "newsapi.yaml" -g swift5 -o "api-mobile"

rm -r $SWIFT_MODULE_SRC""*
cp -R "api-mobile/OpenAPIClient/Classes/OpenAPIs/". $SWIFT_MODULE_SRC
rm -r "api-mobile"
