model#!/bin/bash
#MODEL_NAME=census4
MODEL_NAME=$1 #

#path du model d’entrainement (creer lors de l entrainement)
#export GCS_JOB_DIR=gs://test1-model1-bucket/test7
export GCS_JOB_DIR=$2
version=$3
#chercher le path exact dans lequel se trouve les binaires du model qui ont été former lors de l’entrainement
#pour l’exemple Estimator Based: on doit retrouve un répertoire nommé:
#GCS_JOB_DIR/export/census/1513445445
PATH_EXPORTED_MODEL=$GCS_JOB_DIR/export
export MODEL_BINARIES=$PATH_EXPORTED_MODEL
#commande gcloud pour deployer un model
gcloud ml-engine versions create $version --model $MODEL_NAME --origin $MODEL_BINARIES --runtime-version 1.4>& error.txt
exit 0


#gcloud ml-engine versions create model_version_75 --model model_75 --origin gs://bucket-75/export/census/1524062566 --runtime-version 1.4