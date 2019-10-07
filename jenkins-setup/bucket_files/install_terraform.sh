#!/bin/bash

export VER="0.12.9"
export ZIP_FILE="terraform_${VER}_linux_amd64.zip"
export URL="https://releases.hashicorp.com/terraform/${VER}/${ZIP_FILE}"
wget "${URL}"
unzip "${ZIP_FILE}"
sudo mv terraform /usr/local/bin/
sudo rm -f "${ZIP_FILE}"
