---
netology:
  children:
    nginx_server:
      hosts:
        ${vm_1_hostname}:
          ansible_host: ${vm_1_ip}
          ansible_user: ${admin_user}
    
    db_server:
      hosts:
        ${vm_2_hostname}:
          ansible_host: ${vm_2_ip}
          ansible_user: ${admin_user}
