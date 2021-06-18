resource "openstack_identity_project_v3" "project_a" {
  name = var.project_a_name
  description = "Project created by Terraform"
}

resource "openstack_identity_project_v3" "project_b" {
  name = var.project_b_name
  description = "Project created by Terraform"
}

resource "openstack_identity_project_v3" "project_denethor" {
  name = var.denethor_name
  description = "Project created by Terraform"
}

resource "openstack_compute_quotaset_v2" "project_a_quotaset" {
  project_id           = openstack_identity_project_v3.project_a.id
  key_pairs            = 5
  ram                  = 20480
  cores                = 16
  instances            = 5
  server_groups        = 1
  server_group_members = 2
  metadata_items = 500
}
resource "openstack_compute_quotaset_v2" "project_b_quotaset" {
  project_id           = openstack_identity_project_v3.project_b.id
  key_pairs            = 10
  ram                  = 40960
  cores                = 32
  instances            = 20
  server_groups        = 4
  server_group_members = 8
  metadata_items = 500

}


resource "openstack_compute_quotaset_v2" "project_denethor_quotaset" {
  project_id           = openstack_identity_project_v3.project_denethor.id
  key_pairs            = 5
  ram                  = 20480
  cores                = 16
  instances            = 5
  server_groups        = 1
  server_group_members = 2
  metadata_items = 500

}




