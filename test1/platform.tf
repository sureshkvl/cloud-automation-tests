provider "openstack" {
  user_name   = "demo"
  tenant_name = "demo"
  password    = "openstack123"
  auth_url    = "http://10.0.1.8:5000/v2.0"
}


variable public_pool_id {
  default = "2d7d8023-3bcf-4b76-9c28-40a8d290d8fd"
}

variable image_id {
  default = "0f173088-24d2-47f4-9ff2-b1bab5030c3b"
}

variable flavor_id {
  default = "6"
}

variable region {
  default = "RegionOne"
}
