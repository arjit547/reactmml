#!/bin/bash

# Update pip
pip install --upgrade pip

# Specify the TruffleHog S3 bucket
TRUFFLEHOG_BUCKET="tuffleoutstore"

# Install TruffleHog
pip install truffleHog

# Run TruffleHog and save findings to a text file
trufflehog --json --repo https://github.com/arjit547/reactmml.git > trufflehog_findings.txt

# Upload TruffleHog findings (text file) to the TruffleHog S3 bucket
aws s3 cp trufflehog_findings.txt s3://${TRUFFLEHOG_BUCKET}/trufflehog_findings.txt
