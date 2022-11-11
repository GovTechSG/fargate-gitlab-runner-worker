# Alpine based image for worker ECS task for runner using AWS Fargate Custom Executor
A simple Docker image that runs sshd service and accepts SSH_PUBLIC_KEY from a GitLab runner using AWS Fargate Custom Executor. It also exports important variables such as `AWS_CONTAINER_CREDENTIALS_RELATIVE_URI` to SSH session.

## Build the image
* Set `IMAGE_NAME` and `IMAGE_TAG` variables as desired.
* Use `docker-compose build` to build the image. Alternatively run: `docker build -t ${IMAGE_NAME}:${IMAGE_TAG}`.

**Note:** If you use `podman` instead of `docker`, install [podman-compose](https://github.com/containers/podman-compose) to work with `docker-compose.yml`.


## Local test
* Set `SSH_PUBLIC_KEY`, `AWS_CONTAINER_CREDENTIALS_RELATIVE_URI` variables.
* To test the image, use `docker-compose down >/dev/null 2>&1; docker-compose up` or `docker run --rm -e SSH_PUBLIC_KEY -e AWS_CONTAINER_CREDENTIALS_RELATIVE_URI ${IMAGE_NAME}:${IMAGE_TAG}`.


## Publish to ECR
* Set `AWS_ACCOUNT_ID` and `AWS_REGION` variables as desired.
* Login to ECR `aws ecr get-login-password --region ${AWS_REGION} | docker login --username AWS --password-stdin ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com`
* Publish to ECR using `docker-compose push` or `docker push ${IMAGE_NAME}:${IMAGE_TAG}` where `${IMAGE_NAME}` starts with the ecr domain `${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com`
