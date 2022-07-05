
terraform {
  required_providers {
    ncloud = {
      source = "NaverCloudPlatform/ncloud"
    }
  }
  required_version = ">= 0.13"
}
# provider
provider "ncloud" {
  access_key  = var.provider_ncp.access_key
  secret_key  = var.provider_ncp.secret_key
  region      = var.provider_ncp.region
  support_vpc = var.provider_ncp.support_vpc
}

# loginkey 
resource "ncloud_login_key" "loginkey" {
  key_name = var.login_key_name
}

# vpc
data "ncloud_vpc" "vpc" {
  name = var.vpc.name
  ipv4_cidr_block = var.vpc.vpc_ip



}

# acl
resource "ncloud_network_acl" "nacl" {
  vpc_no = ncloud_vpc.vpc.id
}
resource "ncloud_init_script" "init" {
  count = 1
  name    = var.init_script[count.index].name
  content = var.init_script[count.index].content
  os_type = var.init_script[count.index].os_type
}

resource "ncloud_subnet" "sub" {
  vpc_no         = ncloud_vpc.vpc.vpc_no
  name = var.subnet.name
  subnet         = var.subnet.subnet_ip
  zone           = "KR-1"
  network_acl_no = ncloud_vpc.vpc.default_network_acl_no
  subnet_type    = "PUBLIC"
  usage_type     = "GEN"
}

// Create a new server instance

resource "ncloud_server" "server" {
  count = var.server_count
  subnet_no                 = ncloud_subnet.sub.id
  name                      = var.server[count.index].name
  server_image_product_code = var.server[count.index].os
  login_key_name            = var.login_key_name
  init_script_no            = ncloud_init_script.init[0].id
}

# public ip
resource "ncloud_public_ip" "public_ip" {
  count = var.server_count
  server_instance_no = ncloud_server.server[count.index].instance_no
}

output "instance_name_and_ip" {
    
  value = "${flatten(formatlist("%s: %s",ncloud_server.server.*.name,ncloud_public_ip.public_ip.*.public_ip))}"
    
}