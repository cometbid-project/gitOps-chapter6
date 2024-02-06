#! /usr/bin/env bash

export AWS_PROFILE=gitops

aws --region us-east-1 ec2 create-key-pair --key-name "gitops" --query 'KeyMaterial' > gitops.pem

ls -al gitops.pem