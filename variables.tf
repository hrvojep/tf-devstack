## Provider related variables
variable "os_auth_url" {
    default = "http://10.123.123.123/identity"
}
variable "os_user" {
    default = "admin"
}
variable "os_tenant" {
    default = "admin"
}
variable "os_password" {
    default = "secret"
}
variable "os_region" {
    default = ""
}

variable "default_domain" {
    default = "default"
  
}
## Admin Project - Denethor

## Project A

variable "project_a_name" {
  default = "project-faramir"
}

variable "project_a_user" {
    default = "Faramir"
}

## Project B

variable "project_b_name" {
  default = "project-boromir"
}

variable "project_b_user" {
    default = "Boromir"
}

## Denethor - Admin Users

variable "denethor_name" {
    default = "project-denethor"
  
}
variable "denethor_user" {
    default = "Denethor"
  
}



