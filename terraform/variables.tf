# variables.tf
variable "project_name" {
  description = "A projekt neve, ami az erőforrások elnevezésében is megjelenik"
  type        = string
  default     = "devops"
}

variable "environment" {
  description = "Környezet neve (dev, staging, prod)"
  type        = string
  default     = "dev"
}

variable "app_port" {
  description = "Az alkalmazás portja"
  type        = number
  default     = 3000
}

variable "github_token" {
  description = "Github token"
  type        = string
  sensitive   = true
}