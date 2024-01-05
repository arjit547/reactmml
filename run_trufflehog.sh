#!/bin/bash

# Specify the TruffleHog S3 bucket
TRUFFLEHOG_BUCKET="tuffleoutstore"

# Find the full path to the TruffleHog executable
TRUFFLEHOG_PATH=$(which trufflehog)

# Run TruffleHog and generate HTML report
${TRUFFLEHOG_PATH} --repo https://github.com/arjit547/reactmml.git > trufflehog_output.txt
sed 's/$/<br>/' trufflehog_output.txt > trufflehog_output.html

# Upload TruffleHog HTML report to the TruffleHog S3 bucket
aws s3 cp trufflehog_output.html s3://${TRUFFLEHOG_BUCKET}/trufflehog_output.html
