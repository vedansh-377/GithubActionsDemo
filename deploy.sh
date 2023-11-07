#!/bin/bash

# Set up AWS credentials using environment variables
export AWS_ACCESS_KEY_ID=your_access_key
export AWS_SECRET_ACCESS_KEY=your_secret_key
export AWS_DEFAULT_REGION=us-west-1

# Delete S3 Bucket
aws s3 rb s3://vedansh --force || true  # Ignore error if bucket doesn't exist

# Deploy S3 Bucket
aws s3api create-bucket --bucket vedansh --region us-west-1 --create-bucket-configuration LocationConstraint=us-west-1

# Rest of your script...
