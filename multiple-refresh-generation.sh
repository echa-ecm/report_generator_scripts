#!/bin/bash

MRF_ENVS_PATH="."
POSITIONAL=()
while [[ $# -gt 0 ]]; do
    key="$1"
    case $key in
        --envs-path)
            MRF_ENVS_PATH="$2"
            shift # past argument
            shift # past value
        ;;
        --token)
            export RF_TOKEN="$2"
            MRF_IDM="--idm"
            shift # past argument
            shift # past value
      ;;
    esac
done
echo $MRF_ENVS_PATH
for MRF_FILE in $MRF_ENVS_PATH/*.env
do
    ./refresh-and-generate.sh "$MRF_FILE" $MRF_IDM --only-generate
done

echo $MRF_IDM
echo $RF_TOKEN
