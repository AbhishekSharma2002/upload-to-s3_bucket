#!/bin/bash

BUILD_PARENT="/home/abhishek/builds"

# Folder aur unke multiple S3 bucket link mapping
declare -A BUCKET_MAP
BUCKET_MAP["arch-bridge-uat"]="s3://archbridge-capital-uat-beta/ s3://archbridge-capital-uat-beta/arch-bridge-uat/"
BUCKET_MAP["uc"]="s3://archbridge-capital-uat-beta/uc/"

echo "Starting deployment from $BUILD_PARENT"

for folder in "$BUILD_PARENT"/*; do
    if [ -d "$folder" ]; then
        FOLDER_NAME=$(basename "$folder")

        if [[ -n "${BUCKET_MAP[$FOLDER_NAME]}" ]]; then
            for S3_BUCKET in ${BUCKET_MAP[$FOLDER_NAME]}; do
                echo "-------------------------------------"
                echo "Found build folder: $FOLDER_NAME"
                echo " Target S3 bucket: $S3_BUCKET"

                aws s3 sync "$folder" "$S3_BUCKET" --delete

                if [ $? -eq 0 ]; then
                    echo "Successfully uploaded $FOLDER_NAME → $S3_BUCKET"
                else
                    echo "Upload failed for $FOLDER_NAME → $S3_BUCKET"
                fi
            done
        else
            echo "Skipping $FOLDER_NAME (no matching bucket mapping)"
        fi
    fi
done