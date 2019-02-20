resource "openstack_compute_instance_v2" "vm1" {                                                    [5/1864]
  name            = "vm1"
  image_id        = "${var.image_id}"
  flavor_id       = "${var.flavor_id}"
  key_pair        = "testkey"
  security_groups = ["sg1"]
  network {
    uuid = "8001d085-e1a6-4859-831e-0995d0f8ba50"
  }
}

resource "openstack_networking_floatingip_v2" "fip_1" {
  pool = "public"
}


resource "openstack_compute_floatingip_associate_v2" "fip_1" {
  floating_ip = "${openstack_networking_floatingip_v2.fip_1.address}"
  instance_id = "${openstack_compute_instance_v2.vm1.id}"
}



resource "openstack_compute_instance_v2" "vm2" {
  name            = "vm2"
  image_id        = "${var.image_id}"
  flavor_id       = "${var.flavor_id}"
  key_pair        = "testkey"
  security_groups = ["sg1"]
  network {
    uuid = "8001d085-e1a6-4859-831e-0995d0f8ba50"
  }
}


resource "openstack_networking_floatingip_v2" "fip_2" {
  pool = "public"
}


resource "openstack_compute_floatingip_associate_v2" "fip_2" {
  floating_ip = "${openstack_networking_floatingip_v2.fip_2.address}"
  instance_id = "${openstack_compute_instance_v2.vm2.id}"
}


