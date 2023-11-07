#!/bin/bash

# Set up AWS credentials using environment variables
export AWS_ACCESS_KEY_ID="AKIARV7VCXZLEBICHUGG"
export AWS_SECRET_ACCESS_KEY="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"

export AWS_DEFAULT_REGION=us-west-1

# Delete S3 Bucket
aws s3 rb s3://vedansh --force  # Ignore error if bucket doesn't exist

# Deploy S3 Bucket
aws s3api create-bucket --bucket vedansh --region us-west-1 --create-bucket-configuration LocationConstraint=us-west-1

# Upload Image to S3
aws s3 cp WhiteSaucePasta.jpg s3://vedansh

# Delete Lambda Function
aws lambda delete-function --function-name vedu --region eu-west-1  # Ignore error if function doesn't exist

# Deploy Lambda Function
aws lambda create-function --function-name vedu --runtime python3.11 --role arn:aws:iam::115941228118:role/lambda --handler lambda_function.lambda_handler --zip-file fileb://PastaOrderFunction-195f7a38-883c-43a0-a8f3-007559e8df72.zip --region eu-west-1

# Export and Store Lex Bot as Artifact
aws lex-models get-export --name "BookTrip_enIN" --export-type "LEX" --resource-type "BOT" --resource-version "1" --output json --no-cli-pager > exported_bot.json

# Download Lex Bot Data
curl -o exported_bot.zip "URL_PROVIDED_IN_JSON"

# List Downloaded Files
ls -l

# Save Exported Bot as Artifact
# (The section for uploading artifacts may need to be handled separately based on your environment and needs.)
