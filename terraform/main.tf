# main.tf
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.0"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

# Runner modul
module "runner" {
  source = "./modules/runner"
  
  network = "minikube"
  github_token = var.github_token
  github_url = "https://github.com/davsza/devops/"
}

# Prometheus modul
module "prometheus" {
  source = "./modules/prometheus"
  
  network = "minikube"
}

# Grafana modul
module "grafana" {
  source = "./modules/grafana"
  
  network = "minikube"
  prometheus_url = "http://prometheus:9090"
}
