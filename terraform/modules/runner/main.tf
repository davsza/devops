# modules/prometheus/main.tf
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.0"
    }
  }
}

resource "docker_image" "runner" {
  name = "runner:latest"
  build {
    context = "./modules/runner"
    dockerfile = "Dockerfile"
    no_cache = true
  }
}

resource "docker_container" "runner" {
  name  = "runner"
  image = docker_image.runner.image_id
  env = ["GITHUB_TOKEN=${var.github_token}", "GITHUB_URL=${var.github_url}"]

  networks_advanced {
    name = var.network
  }
}