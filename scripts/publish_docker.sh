# Create dockerpath
account=caohoaiphuong
dockername=devops-capstone
version=v1.0.0
dockerpath=$dockername:$version

docker --version
docker build -t $dockerpath .

# Authenticate & tag
echo "Docker ID and Image: $dockerpath"
docker tag $dockerpath $account/$dockerpath
docker images
docker login

# Push image to a docker repository
docker push $account/$dockerpath