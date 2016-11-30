#!/bin/bash

# ADO - Scripts to process ADO autobuses web data.
# Copyright (C) 2013 Thomas Leplus
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

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
