terraform {
required_version = ">= 0.14.0"
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.47.0"
    }
  }
}

# provider
provider "openstack" {
  user_name   = "${var.provider_openstack.user_name}"
  tenant_name = "${var.provider_openstack.tenant_name}"
  password    = "${var.provider_openstack.password}"
  auth_url    = "${var.provider_openstack.auth_url}"
  region      = "${var.provider_openstack.region}"
}

# Generate keypair
resource "openstack_compute_keypair_v2" "test-keypair" {
  name = "${var.key_name}"
  public_key = "${var.public_key}"
}

# VM create

resource "openstack_compute_instance_v2" "linux_vm" {
  count = "${var.linux_instance_count}"
  name            = "${var.instance_linux[count.index].name}"
  image_name      = "${var.instance_linux[count.index].image}"
  flavor_id       = "${var.instance_linux[count.index].flavor_id}"
  key_pair        = "${var.key_name}"
  security_groups = "${var.instance_linux[count.index].security_groups}"

  user_data = file("${var.instance_linux[count.index].user_data}")

  network {
    name = "${var.networks.private_network}"
  }
}

resource "openstack_compute_instance_v2" "windows_vm" {
  count = "${var.windows_instance_count}"
  name            = "${var.instance_windows[count.index].name}"
  image_name      = "${var.instance_windows[count.index].image}"
  flavor_id       = "${var.instance_windows[count.index].flavor_id}"
  security_groups = "${var.instance_windows[count.index].security_groups}"

  user_data = file("${var.instance_windows[count.index].user_data}")
  network {
    name = "${var.networks.private_network}"
  }
}



# floating ip
resource "openstack_networking_floatingip_v2" "fip_lin" {
  count = "${var.linux_instance_count}"
  pool = "${var.networks.public_network}"
}

resource "openstack_networking_floatingip_v2" "fip_win" {
  count = "${var.windows_instance_count}"
  pool = "${var.networks.public_network}"
}

# associate ip with instance
resource "openstack_compute_floatingip_associate_v2" "fip_associate_lin" {
  count = "${var.linux_instance_count}"
  floating_ip = "${openstack_networking_floatingip_v2.fip_lin[count.index].address}"
  instance_id = "${openstack_compute_instance_v2.linux_vm[count.index].id}"
}

resource "openstack_compute_floatingip_associate_v2" "fip_associate_win" {
  count = "${var.windows_instance_count}"
  floating_ip = "${openstack_networking_floatingip_v2.fip_win[count.index].address}"
  instance_id = "${openstack_compute_instance_v2.windows_vm[count.index].id}"
}


output "linux_ip" {
    value = "${flatten(formatlist("%s: %s",openstack_compute_instance_v2.linux_vm.*.name,openstack_compute_floatingip_associate_v2.fip_associate_lin.*.floating_ip))}"
}

output "windows_ip" {
  value = "${flatten(formatlist("%s: %s",openstack_compute_instance_v2.windows_vm.*.name,openstack_compute_floatingip_associate_v2.fip_associate_win.*.floating_ip))}"
}