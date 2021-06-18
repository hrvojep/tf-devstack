# //Refactor this into a module. Name of user, name of group. Done.
# ## Adds Denethor Admin User to a specific Group 
# resource "openstack_identity_user_membership_v3" "denethor_group_assignment" {
#     user_id = openstack_identity_user_v3.denethor_user.id
#     group_id = openstack_identity_group_v3.gondor_pg.id

  
# }
# #
# ## Adds Gondor Group against Steward (Admin) role
# resource "openstack_identity_role_assignment_v3" "denethor_steward_group_assignment" {
#     group_id = openstack_identity_group_v3.gondor_pg.id
#     role_id = openstack_identity_role_v3.steward_role.id
#     domain_id = var.default_domain
# }

# ## Assigns Denethor to Faramir and Boromir Project via group - Gondor Administration
# ## Assigns a Group/Role to a specific project - Project A
# resource "openstack_identity_role_assignment_v3" "gondor_project_assignment_1" {
#     project_id = openstack_identity_project_v3.project_a.id
#     group_id = openstack_identity_group_v3.gondor_pg.id
#     role_id = openstack_identity_role_v3.steward_role.id

    
# }
# # Assigns a Group to a specific project - Project B
# resource "openstack_identity_role_assignment_v3" "gondor_project_assignment_2" {
#     project_id = openstack_identity_project_v3.project_b.id
#     group_id = openstack_identity_group_v3.gondor_pg.id
#     role_id = openstack_identity_role_v3.steward_role.id

    
# }

# # Assigns Denethor to his own project as well via User
# resource "openstack_identity_role_assignment_v3" "gondor_project_assignment_3" {
#     project_id = openstack_identity_project_v3.project_denethor.id
#     user_id = openstack_identity_user_v3.denethor_user.id
#     role_id = openstack_identity_role_v3.steward_role.id   
# }