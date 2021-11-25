provider "google"{
    credentials = "${file("service-account.json")}"
    project     = "projetoteste-333016"
    region     = "us-central1"
    zone        = "us-central1"
}
resource "google_compute_instance" "vm_instance" {
  count        = 1
  name         = "srv-wordpress${count.index+1}"
  machine_type = "e2-micro"
  zone         = "us-central1-c"
  boot_disk {
    initialize_params {
      image = "ubuntu-2004-focal-v20211102"
    }
  }

  network_interface {
    network       = "default"
    access_config {
    }
  }
  desired_status = "TERMINATED" //TERMINATED comando para stopar a VM (RUNNING É PARA RODAR A VM)
}
/*

resource "google_compute_instance" "vm_instance" {
    name = "terraform"
    machine_type = "f1-micro"

    boot_disk {
        initialize_params{
            image = "debian-cloud/debian-9"
        }
    }

    network_interface {
      network = "${google_compute_network.vpc_network.self_link}"
      access_config ={
      }
    } 
}

resource "google_compute_network" "vpc_network" {
    name = "terraform-network"
    auto_create_subnetworks = "true"
}*/
