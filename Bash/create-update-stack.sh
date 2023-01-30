#!/bin/bash

if aws cloudformation describe-stacks --stack-name $1 --region us-east-1; then
    echo "Stack exists, updating..."
    aws cloudformation update-stack \
        --stack-name $1 \
        --template-body file://../$2 \
        --parameters file://../parameters/$3 \
        --capabilities "CAPABILITY_IAM" "CAPABILITY_NAMED_IAM" --region=us-east-1
else
    echo "Stack does not exist, creating..."
    aws cloudformation create-stack \
        --stack-name $1 \
        --template-body file://../$2 \
        --parameters file://../parameters/$3 \
        --capabilities "CAPABILITY_IAM" "CAPABILITY_NAMED_IAM" --region=us-east-1
fi
