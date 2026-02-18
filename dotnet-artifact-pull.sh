#!/bin/bash

RESPONSE=$(curl -s -u "admin:Mitul_Devops@123" "http://192.168.0.32:8081/service/rest/v1/search?sort=version&direction=desc&repository=clean-architechture-kp")

LATEST_VER=$(echo "$RESPONSE" | jq -r '.items[0].version')

LATEST_PACKAGES=$(echo "$RESPONSE" | jq -r --arg VER "$LATEST_VER" '.items[] | select(.version == $VER) | .assets[0].downloadUrl')

echo "Latest version: $LATEST_VER"

echo "Latest Urls: $LATEST_PACKAGES"

SECOND_LATEST_VER=$(echo "$RESPONSE" | jq -r '[.items[].version] | unique | reverse | .[1]')

SECOND_LATEST_PACKAGES=$(echo "$RESPONSE" | jq -r --arg VER "$SECOND_LATEST_VER" '.items[] | select(.version == $VER) | .assets[0].downloadUrl')

echo "Second Latest version: $SECOND_LATEST_VER"

echo "Latest Urls: $SECOND_LATEST_PACKAGES"
