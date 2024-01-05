#!/bin/bash

# Specify the TruffleHog S3 bucket
TRUFFLEHOG_BUCKET="tuffleoutstore"

# Run TruffleHog and generate HTML report
trufflehog --repo https://github.com/username/repository.git > trufflehog_output.txt
sed 's/$/<br>/' trufflehog_output.txt > trufflehog_output.html

# Upload TruffleHog HTML report to the TruffleHog S3 bucket
aws s3 cp trufflehog_output.html s3://${TRUFFLEHOG_BUCKET}/trufflehog_output.html
