#!/bin/bash

RESPONSE=$(curl -s -u "admin:Mitul_Devops@123" "http://192.168.0.32:8081/service/rest/v1/search?sort=version&direction=desc&repository=my-custom-npm-package-kp")

LATEST=$(echo "$RESPONSE" | jq -r '.items[0].assets[0].downloadUrl')

echo "Latest Artifact is - $LATEST"

SECOND_LATEST=$(echo "$RESPONSE" | jq -r '.items[1].assets[0].downloadUrl')

echo "Second Latest Artifact is - $SECOND_LATEST"
