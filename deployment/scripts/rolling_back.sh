echo $(aws eks update-kubeconfig --region us-east-1 --name devops-capstone)

PROD_DNS=$(aws cloudformation \
            list-exports --query "Exports[?Name==\`clusterDNS\`].Value" \
            --no-paginate --output text)
BLUE_DNS=$(kubectl get service blue-svc | awk '{print $4}' | tail -n1)
GREEN_DNS=$(kubectl get service green-svc | awk '{print $4}' | tail -n1)

echo "PROD_DNS: $PROD_DNS"
echo "BLUE_DNS: $BLUE_DNS"
echo "GREEN_DNS: $GREEN_DNS"

if [[ "$BLUE_DNS" = "$PROD_DNS" ]]
then
    echo "blue is prod now => roll back to green"
    ROLLBACK_DNS=$GREEN_DNS
fi
if [[ "$GREEN_DNS" = "$PROD_DNS" ]]
then
    echo "green is prod now => roll back to blue"
    ROLLBACK_DNS=$BLUE_DNS
fi
echo "ROLLBACK_DNS: $ROLLBACK_DNS"
if [[ -z $ROLLBACK_DNS ]]
then
    echo "Blue or green DNS didnot match to production please. Some thing wrong!"
else    
    echo "Rolling back to previous production"
    aws cloudformation deploy \
    --template-file ../../deployment/stack/cloudfront.yml \
    --stack-name "BlueGreenStack" \
    --parameter-overrides clusterDNS=$ROLLBACK_DNS \
    --tags project=udapeople Name=BlueGreen
fi
