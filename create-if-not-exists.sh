#!/bin/bash
#
# try a command, and if it returns some non-zero exit code, run some other stuff

rg_name="<< INPUT YOUR RG NAME >>"

rg_id="if nothing works this will be the output"

rg_exists="az group show \
  --name ${rg_name}"

## uncomment this to inspect the exit code
# $rg_exists &> /dev/null
# exit_code=$?
# echo "exit code was $exit_code"

if ! $rg_exists &> /dev/null; then

  echo "didn't find it, create it"

  az group create \
    --name "${rg_name}" \
    --location "eastus" \
    --output none

fi

rg_id=$(az group show \
  --name "${rg_name}" \
  --query id \
  --output tsv)

echo "$rg_id"
