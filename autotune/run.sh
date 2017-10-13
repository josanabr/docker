#!/bin/bash
#
# Este script se puede ejecutar de las siguientes maneras
#
# 1. ./run.sh
#    Ejecutara el contenedor "josanabr/autotune" y archivo "example_runs.json"
#
# 2. ./run.sh micontenedor
#    Ejecutara el contenedor "micontenedor" y archivo "example_runs.json"
#
# 3. ./run.sh micontenedor miarchivo.json
#    Ejecutara el contenedor "micontenedor" y archivo "miarchivo.json"
#
# +----------+
# |IMPORTANTE| el archivo .json debe existir en el directorio donde se ejecuta
# +----------+ el script 
#
# Autor: John Sanabria - john.sanabria@correounivalle.edu.co
# Fecha: 2017-10-13
#
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
