#!/bin/bash

set -euo pipefail

SSH_PATH="${HOME}/.ssh"

mkdir -p "${SSH_PATH}"

cat > "${SSH_PATH}/config" <<-END
	Host *
	  Port ${INPUT_PORT}
	  User ${INPUT_USERNAME}
	  IdentityFile ${SSH_PATH}/id_rsa.key
END

ssh-keyscan -p "${INPUT_PORT}" -H "${INPUT_HOST}" > "${SSH_PATH}/known_hosts"

echo "${INPUT_KEY}" > "${SSH_PATH}/id_rsa.key"
chmod 600 "${SSH_PATH}/id_rsa.key"

# shellcheck disable=SC2029
ssh "${INPUT_HOST}" "${INPUT_COMMAND}"
