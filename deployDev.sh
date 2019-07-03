#!/bin/bash

#
# Copyright Elasticsearch B.V. and/or licensed to Elasticsearch B.V. under one
# or more contributor license agreements. Licensed under the Elastic License;
# you may not use this file except in compliance with the Elastic License.
#

set -e
set +x

# Expected env variables:
# * GPROJECT - e.g. "elastic-bekitzur"
# * GCE_ACCOUNT - credentials for the google service account (JSON blob)

if [[ -z "${GPROJECT}" ]]; then
    echo "GPROJECT is not set, e.g. 'GPROJECT=elastic-bekitzur'"
    exit 1
fi

export EMS_PROJECT="emsfiles"

export TILE_HOST="tiles.maps.elastic.co"
export VECTOR_HOST="storage.googleapis.com/${GPROJECT}-${EMS_PROJECT}-vector-dev"
export CATALOGUE_BUCKET=${GPROJECT}-${EMS_PROJECT}-catalogue-dev
export VECTOR_BUCKET=${GPROJECT}-${EMS_PROJECT}-vector-dev
export VECTOR_HOST="storage.googleapis.com/${VECTOR_BUCKET}"


unset ARCHIVE_BUCKET

./build.sh
