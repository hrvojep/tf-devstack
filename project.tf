resource "openstack_identity_project_v3" "project_a" {
  name = var.project_a_name
  description = "Project created by Terraform"
}

resource "openstack_compute_quotaset_v2" "project_a_quotaset" {
  project_id           = openstack_identity_project_v3.project_a.id
  key_pairs            = 10
  ram                  = 40960
  cores                = 32
  instances            = 20
  server_groups        = 4
  server_group_members = 8
}

