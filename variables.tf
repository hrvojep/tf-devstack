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
## Project A

variable "project_a_name" {
  default = "Argonath"
}

variable "project_a_user" {
    default = "project_a"
}

