provider "google" {
project = "erudite-scholar-351720"
region = "us-west2-c
}

resource "google_compute_instance" "kremkus-vm" {
name = "kremkus-vm-dev1"
zone = "us-west2-c"
boot_disk {
initialize_params {
  image = "debian-cloud/debian-9"
  size = "10"
}
}
machine_type = "f1-micro" 
network_interface {
network = "default"
}
}
