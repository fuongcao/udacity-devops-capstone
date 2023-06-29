echo $(aws eks update-kubeconfig --region us-east-1 --name devops-capstone)

BLUE_DNS=$(kubectl get service blue-svc | awk '{print $4}' | tail -n1)
if [[ -z BLUE_DNS ]]
then
    echo "Cannot find blue DNS"
else
    aws cloudformation deploy \
    --template-file ../../deployment/stack/cloudfront.yml \
    --stack-name "BlueGreenStack" \
    --parameter-overrides clusterDNS=$BLUE_DNS \
    --tags project=udapeople Name=BlueGreen
fi