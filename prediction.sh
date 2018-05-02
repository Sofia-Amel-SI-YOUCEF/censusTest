#!/bin/bash

#parametres
#path du model d’entrainement (creer durant entrainement)

#export GCS_JOB_DIR=gs://test1-model1-bucket/test7 #
#export JOB_NAME=census_prediction15 ##
#MODEL=census4 #
#path des donnees en entree pour la prediction
#INPUT_PATH=gs://test1-model1-bucket/prediction_data/census #

export GCS_JOB_DIR=$1 #
export JOB_NAME=$2
MODEL=$3  
#path des donnees en entree pour la prediction
INPUT_PATH=$4
#path des resultats de la prediction
OUTPUT_PATH=$GCS_JOB_DIR/predictions 
echo $OUTPUT_PATH>fichier2.txt
#commande d entrainement
gcloud ml-engine jobs submit prediction $JOB_NAME    --model $MODEL --version v1     --data-format TEXT     --region us-central1     --input-paths $INPUT_PATH --output-path $OUTPUT_PATH>& error.txt

exit 0
