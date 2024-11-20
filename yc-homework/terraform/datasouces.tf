locals {
    local_admin = "admin"
    local_admin_pub_key = "${file("../ssh_keys/id_rsa.pub")}"
}

data "template_file" "cloud_init" {
    template = file("./templates/cloud_init.cfg.tpl")
    vars = {
        local_user = local.local_admin
        local_admin_public_key = local.local_admin_pub_key
    }
}

resource "local_file" "ansible_inventory" {
    content = templatefile("./templates/hosts.tpl",
        {
            admin_user = local.local_admin
            vm_1_hostname = yandex_compute_instance.vm_1.name
            vm_1_ip = yandex_compute_instance.vm_1.network_interface.0.nat_ip_address
            vm_2_hostname = yandex_compute_instance.vm_2.name
            vm_2_ip = yandex_compute_instance.vm_2.network_interface.0.nat_ip_address
        })

    filename = "../ansible/hosts.yml"
    directory_permission = "0755"
    file_permission = "0644"
}