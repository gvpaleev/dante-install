#!/bin/bash
# This is a comment

if [[ ${1} == ""  ||  ${2} == "" ]]; then
	exit 1
fi

user=${1}
password=$(mkpasswd --method=md5 ${2})

echo "${user}:${password}" >> /etc/dante.passwd
