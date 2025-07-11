variable "location" {
  description = "The Azure location to deploy the resources"
  type        = string
  default     = "East US"
}

variable "environment" {
  description = "The environment for the deployment (e.g., dev, test, prod)"
  type        = string
  default     = "dev"
}

variable "password" {
  description = "The password for the Pi-hole web interface"
  type        = string
  sensitive   = true
}

variable "timezone" {
  description = "The timezone for the deployment"
  type        = string
  default     = "America/New_York"
}

variable "ip_restriction" {
  description = "IP restriction settings for the App Service"
  type = map(object({
    action     = string
    priority   = number
    name       = string
    ip_address = string
  }))
  default = {}
}

variable "pihole_version" {
  description = "The version of the Pi-hole Docker image to use"
  type        = string
  default     = "latest"
}
