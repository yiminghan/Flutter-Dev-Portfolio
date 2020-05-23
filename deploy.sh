# This script builds a new flutter web instance and pushes everything to GCloud
flutter build web --release

rm -r deployment/public 
mkdir deployment/public

cp -a ./build/web/ ./deployment/public

# upload to gcloud
cd deployment
gcloud app deploy