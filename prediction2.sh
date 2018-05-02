#!/bin/bash

#parametres
#path du model d’entrainement (creer durant entrainement)

#export GCS_JOB_DIR=gs://test1-model1-bucket/test32 #
export GCS_JOB_DIR=$1

#export JOB_NAME=dataset1CustomEstimatorPrediction012 #
export JOB_NAME=$2

#MODEL=gs://test1-model1-bucket/test32/export/census/1518177059 #
MODEL=$3

#path des donnees en entree pour la prediction
#INPUT_PATH=gs://test1-model1-bucket/prediction_data/dso_train_dataset2.json #
INPUT_PATH=$4


#path des resultats de la prediction
OUTPUT_PATH=$GCS_JOB_DIR/predictions 

#commande d entrainement
gcloud ml-engine jobs submit prediction $JOB_NAME    --model-dir $MODEL   --data-format TEXT   --region us-central1     --input-paths $INPUT_PATH --output-path $OUTPUT_PATH


exit 0
