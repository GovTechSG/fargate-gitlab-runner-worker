#!/bin/sh

# Adapted from https://gitlab.com/tmaczukin-test-projects/fargate-driver-debian

if [ -n "${SSH_PUBLIC_KEY}" ]; then
  echo "Received SSH_PUBLIC_KEY. Setting up SSH daemon"

  # Create a folder to store the user's SSH keys if it does not exist.
  USER_SSH_KEYS_FOLDER=~/.ssh
  [ ! -d ${USER_SSH_KEYS_FOLDER} ] && mkdir -p ${USER_SSH_KEYS_FOLDER}

  # Copy contents from the `SSH_PUBLIC_KEY` environment variable
  # to the `$USER_SSH_KEYS_FOLDER/authorized_keys` file.
  # The environment variable must be set when the container starts.
  echo "${SSH_PUBLIC_KEY}" > ${USER_SSH_KEYS_FOLDER}/authorized_keys

  # Clear the `SSH_PUBLIC_KEY` environment variable.
  unset SSH_PUBLIC_KEY

  # Set AWS_CONTAINER_CREDENTIALS_RELATIVE_URI for Gitlab Runner ECS task to assume role in ssh session
  export SSH_ENV="AWS_CONTAINER_CREDENTIALS_RELATIVE_URI=\"$AWS_CONTAINER_CREDENTIALS_RELATIVE_URI\""

  # Start the SSH daemon
  echo "Starting SSH daemon"
  exec /usr/sbin/sshd -D -o "SetEnv=${SSH_ENV}"
else
  echo "No SSH_PUBLIC_KEY is provided. Proceed without SSH daemon"
  exec "$@"
fi
