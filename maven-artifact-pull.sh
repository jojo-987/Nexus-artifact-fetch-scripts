#!/bin/bash

RESPONSE=$(curl -s -u "admin:Mitul_Devops@123" "http://192.168.0.32:8081/service/rest/v1/search?sort=version&direction=desc&repository=Simple-java-maven-app-kp")

LATEST=$(echo "$RESPONSE" | jq -r '.items[0].assets[] | select(.downloadUrl | endswith(".jar")) | .downloadUrl')

SECOND_LATEST=$(echo "$RESPONSE" | jq -r '.items[1].assets[] | select(.downloadUrl | endswith(".jar")) | .downloadUrl')

echo "Latest Artifact is - $LATEST"

echo "Second Latest Artifact is - $SECOND_LATEST"
