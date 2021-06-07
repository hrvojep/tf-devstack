# Project A - Aragorn
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
    group_id = openstack_identity_group_v3.gondor_pg.id
}

# Project B - Boromir

resource "openstack_identity_user_v3" "project_b_user" {
  name = var.project_b_user
  default_project_id = openstack_identity_project_v3.project_b.id
  
  password = "Hashi123!"
  description = var.project_b_user
}
resource "openstack_identity_role_v3" "project_b_role" {
  name = "project_b_role"
}

resource "openstack_identity_role_assignment_v3" "project_b_ra" {
    user_id = openstack_identity_user_v3.project_b_user.id
    group_id = openstack_identity_group_v3.gondor_pg.id
    project_id = openstack_identity_project_v3.project_b.id
    role_id = openstack_identity_role_v3.project_b_role.id
}

## Admin User - denethor

resource "openstack_identity_user_v3" "denethor_user" {
  name = var.denethor_user
  password = "Hashi123!"
  description = var.denethor_user
}

resource "openstack_identity_role_v3" "denethor_role" {
    name = "denethor Role"
  
}

## Project Group for Administrative Group

resource "openstack_identity_group_v3" "gondor_pg" {
  name = "gondor Project Group"
  description = "gondor Project Group"

}

resource "openstack_identity_role_assignment_v3" "gondor_role_assignment" {
    group_id = openstack_identity_group_v3.gondor_pg.id
    role_id = openstack_identity_role_v3.denethor_role.id
  
}