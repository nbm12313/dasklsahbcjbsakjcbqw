# main.tf

# Define input variables
variable "cpuCores" {
  type        = number
  description = "Number of CPU cores"
}

variable "ramCapacity" {
  type        = number
  description = "RAM capacity in GB"
}

variable "diskCapacity" {
  type        = number
  description = "Disk capacity in GB"
}

variable "isoPath" {
  type        = string
  description = "Path to the ISO file"
}

# Define the provider (e.g., for a virtualization platform like VMware, VirtualBox, etc.)
provider "virtualbox" {
  # Provider configuration
}

# Define the virtual machine resource
resource "virtualbox_vm" "my_vm" {
  name          = "my_vm"
  cpus          = var.cpuCores
  memory        = var.ramCapacity * 1024  # Convert GB to MB
  storage_size  = var.diskCapacity
  iso_path      = var.isoPath
  boot_wait     = "10s"
  boot_command  = ["<wait10s>"]
}

# Define the output for RDP connection information
output "rdp_info" {
  value = {
    ip_address = virtualbox_vm.my_vm.ip_address
    port       = virtualbox_vm.my_vm.rdp_port
    username   = virtualbox_vm.my_vm.rdp_username
    password   = virtualbox_vm.my_vm.rdp_password
  }
}