#!/bin/bash

bucket=$1
# bucket=gs://[BUCKET_NAME]/
echo $1 >fichier1.txt
gsutil mb $bucket>&error.txt