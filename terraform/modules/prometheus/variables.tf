# modules/prometheus/variables.tf
variable "network" {
  description = "Docker network neve"
  type        = string
}

variable "app_port" {
  description = "NodeJS alkalmazás portja"
  type        = number
  default     = 3000
}