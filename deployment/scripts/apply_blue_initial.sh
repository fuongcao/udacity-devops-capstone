BUILD_DATE=$(date '+%Y%m%d%H%M%S')
IMAGE_TAG=build-initial

cat ../../deployment/blue-deployment.yml.template |\
    sed "s|DOCKER_IMAGE_TAG|$IMAGE_TAG|\
    g;s|BUILD_DATE_VALUE|${BUILD_DATE}|g;s|VERSION_INFO_VALUE|${IMAGE_TAG}|\
    g" > ../../deployment/app-deployment.yml

echo $(aws eks update-kubeconfig --region us-east-1 --name devops-capstone)

kubectl apply -f ../../deployment/app-deployment.yml
kubectl apply -f ../../deployment/blue-svc.yml
kubectl get deployment,pods,svc 
kubectl get service blue-svc | awk '{print $4}' | tail -n1
