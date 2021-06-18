# //TODO refactor this into a module. SSH/ICMP boolean. remote prefix.
# // Cannot manipulate default neutron template with Terraform.
# ##FARAMIR - Project A

# resource "openstack_networking_secgroup_v2" "default_sg_faramir" {
#     name = "Gondor Default Rules"
#     tenant_id = openstack_identity_project_v3.project_a.id
# }
# resource "openstack_networking_secgroup_rule_v2" "default_sg_faramir_ssh" {
#   direction         = "ingress"
#   ethertype         = "IPv4"
#   protocol          = "tcp"
#   port_range_min    = 22
#   port_range_max    = 22
#   remote_ip_prefix  = "0.0.0.0/0"
#   security_group_id = openstack_networking_secgroup_v2.default_sg_faramir.id
# }

# resource "openstack_networking_secgroup_rule_v2" "default_sg_faramir_icmp" {
#   direction         = "ingress"
#   ethertype         = "IPv4"
#   protocol          = "icmp"
#   remote_ip_prefix  = "0.0.0.0/0"
#   security_group_id = openstack_networking_secgroup_v2.default_sg_faramir.id
# }


# ##BOROMIR - Project B
# resource "openstack_networking_secgroup_v2" "default_sg_boromir" {
#     name = "Gondor Default Rules"
#     tenant_id = openstack_identity_project_v3.project_b.id
# }
# resource "openstack_networking_secgroup_rule_v2" "default_sg_boromir_ssh" {
#   direction         = "ingress"
#   ethertype         = "IPv4"
#   protocol          = "tcp"
#   port_range_min    = 22
#   port_range_max    = 22
#   remote_ip_prefix  = "0.0.0.0/0"
#   security_group_id = openstack_networking_secgroup_v2.default_sg_boromir.id
# }

# resource "openstack_networking_secgroup_rule_v2" "default_sg_boromir_icmp" {
#   direction         = "ingress"
#   ethertype         = "IPv4"
#   protocol          = "icmp"
#   remote_ip_prefix  = "0.0.0.0/0"
#   security_group_id = openstack_networking_secgroup_v2.default_sg_boromir.id
# }

# ##DENETHOR - Project Denethor

# resource "openstack_networking_secgroup_v2" "default_sg_denethor" {
#     name = "Gondor Default Rules"
#     tenant_id = openstack_identity_project_v3.project_denethor.id
# }
# resource "openstack_networking_secgroup_rule_v2" "default_sg_denethor_ssh" {
#   direction         = "ingress"
#   ethertype         = "IPv4"
#   protocol          = "tcp"
#   port_range_min    = 22
#   port_range_max    = 22
#   remote_ip_prefix  = "0.0.0.0/0"
#   security_group_id = openstack_networking_secgroup_v2.default_sg_denethor.id
# }

# resource "openstack_networking_secgroup_rule_v2" "default_sg_denethor_icmp" {
#   direction         = "ingress"
#   ethertype         = "IPv4"
#   protocol          = "icmp"
#   remote_ip_prefix  = "0.0.0.0/0"
#   security_group_id = openstack_networking_secgroup_v2.default_sg_denethor.id
# }