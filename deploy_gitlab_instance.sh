#!/bin/bash
#
# WARNING: This is how we use it. You can base your deployment on this script
# if you want. But it's not meant to fit everywhere
#

set -eux

TAG=$1

oc whoami || (echo You must be logged on your target instance && exit 1)

GITLAB_INSTANCE_PATH=./gitlab-${TAG}-instance.yml
test -f ${GITLAB_INSTANCE_PATH} && oc delete -f ${GITLAB_INSTANCE_PATH} && rm ${GITLAB_INSTANCE_PATH}
export GITLAB_RUNNER_SERVICE_NAME=gitlab-runner-${TAG}

set +x
PARAMETERS=""
for parameter in $(env | grep -E "GITLAB_|MINIO_"); do
    PARAMETERS="${PARAMETERS} -p ${parameter}"
done
set -x

oc process -f gitlab-runner.yaml -o yaml ${PARAMETERS} > ${GITLAB_INSTANCE_PATH}

oc create -f ${GITLAB_INSTANCE_PATH}
