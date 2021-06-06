resource "openstack_identity_user_v3" "project_a_user" {
  name = var.project_a_user
  default_project_id = openstack_identity_project_v3.project_a.id
  password = "Hashi123!"
  description = var.project_a_user
}