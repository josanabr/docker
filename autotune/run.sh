#!/bin/bash
if [ "x" == "x${1}" ]; then
	CONTAINER="josanabr/autotune"
	JSONFILE="example_runs.json"
else
	CONTAINER="${1}"
	if [ "x" == "x${2}" ]; then
		JSONFILE="example_runs.json"
	else
		JSONFILE="${2}"
	fi
fi
echo "Ejecutando contenedor ${CONTAINER} con archvio ${JSONFILE}"
docker run -e jsonfile="/run/${JSONFIFLE}" -v $(pwd):/run ${CONTAINER}
