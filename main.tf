terraform {
required_version = ">= 0.14.0"
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.35.0"
    }
  }
}

# Configure the OpenStack Provider
provider "openstack" {
  user_name   = var.os_user
  tenant_name = var.os_tenant
  password    = var.os_password
  auth_url    = var.os_auth_url
  region      = var.os_region
}
