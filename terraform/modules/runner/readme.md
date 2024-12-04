## Self-hosted Github Actions runner

```
docker build -t runner:latest .
docker run --network=minikube -e GITHUB_URL=https://github.com/davsza/devops -e GITHUB_TOKEN=${GH_REG_TOKEN} runner:latest
```

GH_REG_TOKEN is an environment variable containing a registration token for selfhosted Github Actions runners, which can be obtained at Settings/Actions/Runners new self-hosted runner.