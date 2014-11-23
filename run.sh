#!/bin/bash

BASEDIR=$(dirname $0)

URL='http://www.ado.com.mx/ado/xml/destinos.xml'
INPUT='destinos.xml'
OUTPUT='destinos.kml'

curl "${URL}" -o "${INPUT}"

rc=$?

if [[ $rc != 0 ]] ; then
    echo "error: curl could not download ${URL} (${rc})" 1>&2
    exit $rc
fi

xsltproc -o "${OUTPUT}" "${BASEDIR}/ado2kml.xsl" "${INPUT}"

rc=$?

if [[ $rc != 0 ]] ; then
    echo "error: xsltproc could not process ${INPUT} (${rc})" 1>&2
    exit $rc
fi

exit 0
