# #Add more flavors with a strong naming convention
# ## Assumption here that all workspaces will have access to all flavors.
# ## aws t2.nano
# resource "openstack_compute_flavor_v2" "t2_nano" {
#     name = "t2.nano"
#     ram = "512"
#     vcpus = "1"
#     disk =  "0"
  
# }

# ## aws t2.x
# resource "openstack_compute_flavor_v2" "t2_micro" {
#     name = "t2.micro"
#     ram = "1024"
#     vcpus = "1"
#     disk =  "0"
  
# }

# ## aws t2.x
# resource "openstack_compute_flavor_v2" "t2_small" {
#     name = "t2.small"
#     ram = "2048"
#     vcpus = "1"
#     disk =  "0"
  
# }

# ## Flavor to Project associations

# resource "openstack_compute_flavor_access_v2" "t2_nano_faramir" {
#   tenant_id = openstack_identity_project_v3.project_a.id
#   flavor_id = openstack_compute_flavor_v2.t2_nano.id
# }

# resource "openstack_compute_flavor_access_v2" "t2_nano_boromir" {
#   tenant_id = openstack_identity_project_v3.project_b.id
#   flavor_id = openstack_compute_flavor_v2.t2_nano.id
# }

# resource "openstack_compute_flavor_access_v2" "t2_micro_boromir" {
#   tenant_id = openstack_identity_project_v3.project_b.id
#   flavor_id = openstack_compute_flavor_v2.t2_micro.id
# }

# resource "openstack_compute_flavor_access_v2" "t2_small_boromir" {
#   tenant_id = openstack_identity_project_v3.project_b.id
#   flavor_id = openstack_compute_flavor_v2.t2_small.id
# }

# resource "openstack_compute_flavor_access_v2" "t2_nano_denethor" {
#   tenant_id = openstack_identity_project_v3.project_denethor.id
#   flavor_id = openstack_compute_flavor_v2.t2_nano.id
# }

# resource "openstack_compute_flavor_access_v2" "t2_micro_denethor" {
#   tenant_id = openstack_identity_project_v3.project_denethor.id
#   flavor_id = openstack_compute_flavor_v2.t2_micro.id
# }

# resource "openstack_compute_flavor_access_v2" "t2_small_denethor" {
#   tenant_id = openstack_identity_project_v3.project_denethor.id
#   flavor_id = openstack_compute_flavor_v2.t2_small.id
# }

# ## Alternative is JSON being sucked in. For each across.

# # resource "openstack_compute_flavor_access_v2" "this" {
# #  for_each = toset(setproduct(local.flavors, local.projects))
# #  tenant_id = each.value[1]
# #  flavor_id = each.value[0]
# # }

# # locals {
# #   // return the list of json files in the files directory.
# #   flavour_files = fileset(path.module, "../flavours/*.json")
  
# # }

# # inputs =  [ for v in local.flavour_files : file(v)
# # for_each = { for v in local.inputs: jsondecode(v).name => v }