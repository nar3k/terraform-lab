#!/usr/bin/env bash


curl -X POST \
-H "Authorization: Bearer $(yc iam create-token)" \
-H "Content-Type: application/json" \
-k "https://compute.api.cloud.yandex.net/compute/v1/instances" \
-d \
' {
  "folderId": "<FOLDERID>",
  "name": "<NAME>",
  "description": "<DESCRIPTION>",
  "zoneId": "ru-central1-a",
  "platformId": "standard-v1",
  "resourcesSpec": {
    "memory": "1073741824",
    "cores": "1",
    "coreFraction": "5"
  },
  "metadata" : {
    "ssh-keys" : "centos:<YOURKEY>"
  },
  "bootDiskSpec": {

    "diskSpec": {
      "size": "41943040000",
      "imageId": "<IMAGEID>",

    },

  },
  "networkInterfaceSpecs": [
    {
      "subnetId": "<SUBNETID>",
      "primaryV4AddressSpec": {},
    }

  ],
  "hostname": "<HOSTNAME>"
}
'
