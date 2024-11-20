resource "yandex_compute_instance" "vm_1" {
  name = "terraform-1"
  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd8p4jt9v2pfq4ol9jqh" # free Ubuntu 22.04
    }
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.subnet_1.id
    nat       = true
  }  
  metadata = {
    user-data = data.template_file.cloud_init.rendered
  }
}

resource "yandex_compute_instance" "vm_2" {
  name = "terraform-2"
  resources {
    cores  = 4
    memory = 4
  }
  boot_disk {
    initialize_params {
      image_id = "fd8p4jt9v2pfq4ol9jqh" # free Ubuntu 22.04
    }
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.subnet_1.id
    nat       = true
  }  
  metadata = {
    user-data = data.template_file.cloud_init.rendered
  }  
}

resource "yandex_vpc_network" "network_1" {
  name = "network-1"
}

resource "yandex_vpc_subnet" "subnet_1" {
  name           = "subnet-1"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.network_1.id
  v4_cidr_blocks = ["192.168.10.0/24"]
}
