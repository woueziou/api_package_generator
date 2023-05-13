echo "Open api Gen tool! write a commit message"
read message
echo "Getting swagger.json"
curl $1
# curl https://map-api-wapp.azurewebsites.net/swagger/v1/swagger.json -o swagger.json
rm -rf lib &&
rm -rf .dart_tool &&
rm -rf doc &&
rm -rf test 
rm -rf .openapi-generator 
# 
echo "############ Generating endpoint ###########"
openapi-generator-cli generate -i swagger.json -g dart-dio -c open-generator-config.yaml --enable-post-process-file 
flutter pub get 
flutter packages pub run build_runner build --delete-conflicting-outputs 
git add .
git commit  -m "$message" 
git push