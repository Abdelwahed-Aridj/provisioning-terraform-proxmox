resource "proxmox_vm_qemu" "ubuntu_cloud_vm" {
  //new vm name
  name = "ubuntu-cloud-vm"
  //vm description
  desc = "ubuntu-cloudinit-vm"
  //new vm id its over 9000!!
  vmid = "9999"
  // node host name
  target_node = "proxmox"
  // quemu guest agent activate!
  agent = 1

// template clone name
  clone = "ubuntu-cloud"
  cores = "1"
  sockets = "1"
  cpu = "host"
  memory = 2048

  network {
    bridge = "vmbr0"
    model = "virtio"

  }

  disk {
    storage = "local-lvm"
    type = "virtio"
    // disksize must end with G M or K case sensitive  
    size = "2252M"
  }

  os_type = "cloud-init"
  ipconfig0 = "ip=192.168.0.17/24,gw=192.168.0.5"
  nameserver = "192.168.2.1"
  ciuser = "serveradmin"
  ssh_user = "root"
  sshkeys = <<EOF
  ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDszRLxQ1Dy/pkWxRPUI8DEQTJPSWUWV49H6Bz3omzuzSZYmLJQNRD2WxpweMDWSizP8eDi0KVtLD7veJfi/TCmI3a30lL7VUOQMidaw71zzp4XawHh0htEUr8P3ztZFxHwZI+det+sQNybC4SLsslvDILpphokRDldsXI4pX0tmPmlGp/NsScUJpIbzpJqftzMp2lC5BObEBwM1kgYrfMavVFoaE8nh3qHQcYZISGiF7NoIoL6SRSLqRn5BoDs9EtueACjOlr6v4pbJd7MnVn8Mh/89w4lgae41TbxLjr1B2ykAduTTn7+vzVCY0UguN42N3EmwQg0gHKc7wD3ArsT root@ubuntu-cloud-vm
  EOF
}