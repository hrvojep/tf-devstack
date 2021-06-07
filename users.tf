resource "openstack_identity_user_v3" "project_a_user" {
  name = var.project_a_user
  default_project_id = openstack_identity_project_v3.project_a.id
  password = "Hashi123!"
  description = var.project_a_user
}

resource "openstack_identity_role_v3" "project_a_role" {
  name = "project_a_role"
}

resource "openstack_identity_role_assignment_v3" "project_a_ra" {
    user_id = openstack_identity_user_v3.project_a_user.id
    project_id = openstack_identity_project_v3.project_a.id
    role_id = openstack_identity_role_v3.project_a_role.id
}
