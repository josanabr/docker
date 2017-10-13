#!/bin/bash
if [ "x" == "x${1}" ]; then
	JSONFILE="example_runs.json"
else
	JSONFILE="${1}"
fi
docker run -e jsonfile="/run/${1}" -v $(pwd):/run josanabr/autotune
