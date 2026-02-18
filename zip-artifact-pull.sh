#!/bin/bash

RESPONSE=$(curl -s -u "admin:Mitul_Devops@123" "http://192.168.0.32:8081/service/rest/v1/search?sort=name&direction=desc&repository=next-todo-kp")

LATEST=$(echo "$RESPONSE" | jq -r '.items[0].assets[0].downloadUrl')

SECOND_LATEST=$(echo "$RESPONSE" | jq -r '.items[1].assets[0].downloadUrl')

echo "Latest Artifact is - $LATEST"

echo "Second Latest Artifact is - $SECOND_LATEST"
