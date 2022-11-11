# Sample worker task's images for Gitlab runner using AWS Fargate Custom Executor driver

Included images for:
* [alpine](alpine)
* [debian](debian) (reference to Gitlab's sample)

This repo is part of a set of repos for the complete setup of ECS Service for managers and workers:
* [fargate-gitlab-runner](../../../fargate-gitlab-runner): Docker image for the ECS task for all runner managers
* [fargate-gitlab-runner-worker](../../../fargate-gitlab-runner-worker): Sample docker images for the worker ECS tasks
* [fargate-gitlab-runner-terraform](../../../fargate-gitlab-terraform): Terraform code to set up complete ECS Service for managers and workers

## Architecture
![ECS Fargate GitLab runner Architecture](assets/ECS%20Fargate%20GitLab%20runner%20Architecture.png)
