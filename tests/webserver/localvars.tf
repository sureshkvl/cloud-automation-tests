resource "openstack_compute_keypair_v2" "test-key" {
  name = "test-key"
  public_key = "${file("config/test-key.pub")}"
}

variable private_key {
  default = "config/test-key"
}

variable key_pair {
  default = "test-key"
}
