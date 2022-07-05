
terraform {
  # ... other configuration ...
  required_providers {
    google = {
      version = "~> 4.0.0"
    }
  }
}

provider "google" {
  project     = "${var.provider_gcp.project}"
  credentials = "${var.provider_gcp.credentials}"
  zone      = "${var.provider_gcp.zone}"
}


resource "google_compute_instance" "vm" {
  
  count = "${var.instance_count}"
  name         = "${var.instance[count.index].name}"
  machine_type = "${var.instance[count.index].machine_type}"
  boot_disk {
    initialize_params {
      image = "${var.instance[count.index].image}"
    }
  }

  network_interface {
    # A default network is created for all GCP projects
    network = "${var.network}"
    access_config {
    }
}

service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = "${var.instance[count.index].email}"
    scopes = ["cloud-platform"]
  }
}

output "instance_name_and_ip" {
    
  value = "${flatten(formatlist("%s: %s",google_compute_instance.vm.*.name,google_compute_instance.vm.*.network_interface.0.access_config.0.nat_ip))}"
    
}