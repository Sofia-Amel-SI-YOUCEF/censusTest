#!/bin/bash



#MODEL_NAME=census4
#export GCS_JOB_DIR=gs://test1-model1-bucket/test7
MODEL_NAME=$1
export GCS_JOB_DIR=$2
#créer un model
gcloud ml-engine models create $MODEL_NAME --regions us-central1>&error.txt

#chercher le path exact dans lequel se trouve les binaires du model qui ont été former lors de l’entrainement

gsutil ls -r $GCS_JOB_DIR/export>&error.txt

exit 0
