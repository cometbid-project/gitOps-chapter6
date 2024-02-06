#! /usr/bin/env bash

export AWS_PROFILE=gitops

aws --region us-east-1 ec2 create-key-pair --key-name "gitops" --query 'KeyMaterial' > gitops_dev.pem

terraform init

terraform plan -var="environment=dev" -var="region=us-west-1"

terraform apply --auto-approve -var="environment=dev" -var="region=us-west-1"

terraform destroy --auto-approve -var="environment=dev" -var="region=us-west-1"
