echo "Building deployment container"
docker build -tag s3test-website-deploy .
echo "Deploying to S3"
docker run $(printenv | grep -E '^AWS' | sed 's/AWS_/-e /g' | sed 's/-e /-e AWS_/g') s3test-website-deploy