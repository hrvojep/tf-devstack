#networks

resource "openstack_networking_network_v2" "network_ithilien" {
    name = "ithilien-network"
    admin_state_up = true
    port_security_enabled = false
    
}
