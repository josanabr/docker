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
if [ ! -f "${JSONFILE}" ]; then
	echo "No se encontro archivo \"${JSONFILE}\""
	echo "Modo de ejecucion ${0} <contenedor> <archivo.json>"
	exit -1
fi
echo "Ejecutando contenedor \"${CONTAINER}\" con archivo \"${JSONFILE}\""
time docker run --rm -e jsonfile="/run/${JSONFILE}" -v $(pwd):/run ${CONTAINER}
