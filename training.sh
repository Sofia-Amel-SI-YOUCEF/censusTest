#!/bin/bash


#$1 = PathDataFile
#$2 = PathTestFile
#$3 = JobName
#$4 = DirPath
#parametres
#TRAIN_FILE=gs://cloudml-public/census/data/adult.data.csv
#EVAL_FILE=gs://cloudml-public/census/data/adult.test.csv
message=`pwd`
 
TRAIN_FILE=$1
EVAL_FILE=$2

export JOB_NAME=$3
export GCS_JOB_DIR=$4
export TRAIN_STEPS=1000

#commandes d entrainements
gcloud ml-engine jobs submit training $JOB_NAME \
                                    --stream-logs \
                                    --runtime-version 1.4 \
                                    --job-dir $GCS_JOB_DIR \
                                    --module-name trainer.task \
                                    --package-path trainer/ \
                                    --region us-central1 \
                                    -- \
                                    --train-files $TRAIN_FILE \
                                    --eval-files $EVAL_FILE \
                                    --train-steps $TRAIN_STEPS \
                                    --eval-steps 100 >& error.txt


exit 0
