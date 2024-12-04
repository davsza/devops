# modules/runner/variables.tf
variable "network" {
  description = "Docker network neve"
  type        = string
}

variable "github_token" {
  description = "Github token"
  type        = string
  sensitive   = true
}

variable "github_url" {
  description = "Github repo url"
  type        = string
}
