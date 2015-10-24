#!/bin/bash
# Authors: KittyKatt & Luminarys
# Requires: bash 4.0+, curl, jq
# Uploads the specified files to fuwa.se and echos their links


files="$@"

if [[ -z "${files}" ]]; then
	printf 'You must submit a file to be uploaded!\n'
	exit 1
else
	printf 'Uploading file(s) now!'
	n=1
	for i in "$@"; do
		printf "\nUploading file #${n} ... "
		out=$(curl -s -F "file=@${i}" https://fuwa.se/api/upload)
        success=$(echo ${out} | jq -r '.success')
		if [[ "${success}" =~ "false" ]]; then
			printf 'error uploading file!\n'
			exit 1
		else
            printf "\nLink: $(echo ${out} | jq -r '.url')\n"
		fi
		((n++))
	done
fi
