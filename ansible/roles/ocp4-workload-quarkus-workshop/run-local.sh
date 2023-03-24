THIS_SCRIPT=$(basename -- "$0")
WORKDIR=$(cd -P -- "$(dirname -- "$0")" && pwd -P)
# same as: cd ..
ROLES_DIR=$(dirname $WORKDIR)
ANSIBLE_DIR=$(dirname $ROLES_DIR)

echo Running $THIS_SCRIPT at $ANSIBLE_DIR

OCP_USERNAME=$(oc whoami)
WORKLOAD='ocp4-workload-quarkus-workshop'


# Get Current DIR
# Move to ANSIBLE_DIR
# Execute Command
# Go Back to Current DIR

pushd $PWD \
  && cd ${ANSIBLE_DIR} \
  && ansible-playbook -vv -i localhost, -c local ./configs/ocp-workloads/ocp-workload.yml \
  -e ocp_workload=${WORKLOAD} \
  -e ocp_username=${OCP_USERNAME} \
  -e ACTION=create ${FILTER_TAG} \
  && popd