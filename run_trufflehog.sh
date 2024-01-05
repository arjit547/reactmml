#!/bin/bash

# Update pip
pip install --upgrade pip

# Specify the TruffleHog S3 bucket
TRUFFLEHOG_BUCKET="tuffleoutstore"

# Install TruffleHog
pip install truffleHog

# Run TruffleHog and save findings to a JSON file
trufflehog https://github.com/arjit547/reactmml.git --json > trufflehog_findings.json

# Convert JSON to HTML (using jq for pretty formatting)
jq . trufflehog_findings.json > trufflehog_findings.html

# Upload TruffleHog findings (HTML file) to the TruffleHog S3 bucket
aws s3 cp trufflehog_findings.html s3://${TRUFFLEHOG_BUCKET}/trufflehog_findings.html
