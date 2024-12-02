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

resource "docker_network" "monitoring_network" {
  name = "${var.project_name}-network"
  driver = "bridge"
  # Enable IPv6 if needed
  ipam_config {
    subnet = "172.18.0.0/16"
    gateway = "172.18.0.1"
  }
  internal = false
}

# Prometheus modul
module "prometheus" {
  source = "./modules/prometheus"
  
  network = docker_network.monitoring_network.name
  nodejs_app_name = module.nodejs_app.container_name
}

# Grafana modul
module "grafana" {
  source = "./modules/grafana"
  
  network = docker_network.monitoring_network.name
  prometheus_url = "http://prometheus:9090"
}

output "network_info" {
  value = {
    network_id   = docker_network.monitoring_network.id
    network_name = docker_network.monitoring_network.name
  }
}