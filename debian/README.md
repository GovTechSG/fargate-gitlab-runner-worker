# Debian Buster based image for usage with AWS Fargate Custom Executor

* Refer to https://gitlab.com/tmaczukin-test-projects/fargate-driver-debian
* If you need aws cli in the work tasks, modify `docker-entrypoint.sh` to add `SetEnv`
```shell
# Set AWS_CONTAINER_CREDENTIALS_RELATIVE_URI for Gitlab Runner ECS task to assume role in ssh session
export SSH_ENV="AWS_CONTAINER_CREDENTIALS_RELATIVE_URI=\"$AWS_CONTAINER_CREDENTIALS_RELATIVE_URI\""

# Start the SSH daemon
echo "Starting SSH daemon"
exec /usr/sbin/sshd -D -o "SetEnv=${SSH_ENV}"
```
