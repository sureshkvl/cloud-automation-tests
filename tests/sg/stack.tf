/* Default security Group */

resource "openstack_compute_secgroup_v2" "sg_secgroup" {
  region = "${var.region}"
  name = "sg_secgroup"
  description = "sg_secgroup"
  rule {
    from_port = "-1"
    to_port = "-1"
    ip_protocol = "icmp"
    cidr = "0.0.0.0/0"
    from_group_id = ""
  }
  rule {
    from_port = "22"
    to_port = "22"
    ip_protocol = "tcp"
    cidr = "0.0.0.0/0"
    from_group_id = ""
  }
}


/* Network and Subnet */

resource "openstack_networking_network_v2" "sg_net" {
  name = "sg_net"
  admin_state_up = "true"
  region = "${var.region}"
}

resource "openstack_networking_subnet_v2" "sg_subnet" {
  name = "sg_subnet"
  network_id = "${openstack_networking_network_v2.sg_net.id}"
  cidr = "10.33.44.0/24"
  ip_version = 4
  region = "${var.region}"
}


/* Router and Router Interface */

resource "openstack_networking_router_v2" "router1" {
  name = "router1"
  region = "${var.region}"
  external_network_id = "${var.public_pool_id}"
}


resource "openstack_networking_router_interface_v2" "router_net_itf" {
  region = "${var.region}"
  router_id = "${openstack_networking_router_v2.router1.id}"
  subnet_id = "${openstack_networking_subnet_v2.sg_subnet.id}"
}


/* Create a Two VMs */


resource "openstack_compute_instance_v2" "sg_vm1" {
  region = "${var.region}"
  name = "sg_vm1"
  image_id = "${var.image_id}"
  flavor_id = "${var.flavor_id}"
  security_groups = ["${openstack_compute_secgroup_v2.sg_secgroup.id}"]
  network {
    uuid = "${openstack_networking_network_v2.sg_net.id}"
  }
  key_pair = "${var.key_pair}"
}


resource "openstack_compute_instance_v2" "sg_vm2" {
  region = "${var.region}"
  name = "sg_vm2"
  image_id = "${var.image_id}"
  flavor_id = "${var.flavor_id}"
  security_groups = ["${openstack_compute_secgroup_v2.sg_secgroup.id}"]  
  network {
    uuid = "${openstack_networking_network_v2.sg_net.id}"
  }
  key_pair = "${var.key_pair}"
}


resource "openstack_networking_floatingip_v2" "sg_vm1_fip" {
  region = "${var.region}"
  pool = "public"
}

resource "openstack_compute_floatingip_associate_v2" "fip_1" {
  floating_ip = "${openstack_networking_floatingip_v2.sg_vm1_fip.address}"
  instance_id = "${openstack_compute_instance_v2.sg_vm1.id}"
}



output "sg_vm1_fip" {
  value = "${openstack_networking_floatingip_v2.sg_vm1_fip.address}"
}


output "sg_vm2_ip" {
  value = "${openstack_compute_instance_v2.sg_vm2.network.0.fixed_ip_v4}"
}
