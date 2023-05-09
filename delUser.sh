#!/bin/bash
# This is a comment

if [[ ${1} == "" ]]; then
	exit 1
fi

user=${1}

sed /${user}:/d /etc/dante.passwd -i

