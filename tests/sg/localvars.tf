resource "openstack_compute_keypair_v2" "test-key" {
  name = "test-key"
  public_key = "${file("test-key.pub")}"
}

variable private_key {
  default = "test-key"
}

variable key_pair {
  default = "test-key"
}

