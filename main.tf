# Create a single Compute Engine instance
resource "google_compute_instance" "default" {
  project      = "erudite-scholar-351720"
  name         = "flask-vm-12"
  machine_type = "f1-micro"
  zone         = "us-east4-c"
  tags         = ["ssh"]

  metadata = {
    enable-oslogin = "TRUE"
  }
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  # Install Flask
  metadata_startup_script = "sudo apt-get update; sudo apt-get install -yq build-essential python-pip rsync; pip install flask"

  network_interface {
    network = "default"

    access_config {
      # Include this section to give the VM an external IP address
    }
  }
}

resource "google_compute_firewall" "ssh" {
  project      = "erudite-scholar-351720"
  name = "allow-ssh"
  allow {
    ports    = ["22"]
    protocol = "tcp"
  }
  direction     = "INGRESS"
  network       = "default"
  priority      = 1000
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["ssh"]
}
resource "google_compute_firewall" "flask" {
  project      = "erudite-scholar-351720"  
  name    = "flask-app-firewall"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["5000"]
  }
  source_ranges = ["0.0.0.0/0"]
}// A variable for extracting the external IP address of the VM
output "Web-server-URL" {
 value = join("",["http://",google_compute_instance.default.network_interface.0.access_config.0.nat_ip,":5000"])
}

