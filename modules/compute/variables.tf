variable "web_vm_name" {
  type        = string
  default     = "test-web-vm"
  description = "The name of the Web Linux Virtual Machine."
}

variable "app_vm_name" {
  type        = string
  default     = "test-app-vm"
  description = "The name of the App Linux Virtual Machine."
}

variable "location" {
  type        = string
  default     = "westeurope"
  description = "The Azure location where the Linux Virtual Machine should exist."
}

variable "resource_group_name" {
  type        = string
  default     = "testrg"
  description = "The name of the Resource Group in which the Linux Virtual Machine should be exist."
}

variable "vm_username" {
  type        = string
  default     = "LinuxAdmin"
  description = "The username of the local administrator used for the Virtual Machine."
}

variable "vm_size" {
  type        = string
  default     = "Standard_F2"
  description = "The SKU which should be used for this Virtual Machine, such as Standard_F2."
}

variable "web_host_name" {
  type        = string
  default     = "LinuxAdminWeb"
  description = "Specifies the Hostname which should be used for this Virtual Machine."
}

variable "app_host_name" {
  type        = string
  default     = "LinuxAdminApp"
  description = "Specifies the Hostname which should be used for this Virtual Machine."
}

variable "vm_os_disk_caching" {
  type        = string
  default     = "ReadWrite"
  description = "The Type of Caching which should be used for the Internal OS Disk. Possible values are None, ReadOnly and ReadWrite."
}

variable "vm_os_disk_storage_account_type" {
  type        = string
  default     = "Standard_LRS"
  description = "The Type of Storage Account which should back this the Internal OS Disk. Possible values are Standard_LRS, StandardSSD_LRS and Premium_LRS."
}

variable "vm_os_disk_size_gb" {
  type        = number
  default     = 50
  description = "The Size of the Internal OS Disk in GB."
}

variable "vm_image_publisher" {
  type        = string
  default     = "Canonical"
  description = "Specifies the publisher of the image used to create the virtual machines."
}

variable "vm_image_offer" {
  type        = string
  default     = "UbuntuServer"
  description = "Specifies the offer of the image used to create the virtual machines."
}

variable "vm_image_sku" {
  type        = string
  default     = "18.04-LTS"
  description = "Specifies the SKU of the image used to create the virtual machines."
}

variable "vm_image_version" {
  type        = string
  default     = "latest"
  description = "Specifies the version of the image used to create the virtual machines."
}

variable "subnet_name" {
  type        = string
  default     = "test-web-subnet"
  description = "The name of Subnet where the Network Interface should be located in."
}

variable "vnet_name" {
  type        = string
  default     = "test-vnet"
  description = "The name of the Vnet, the subnet belongs to."
}

variable "vnet_resource_group_name" {
  type        = string
  default     = "value"
  description = "The resource group name of the Vnet."
}

variable "web_subnet_id" {
   type        = string
   description = "The web subnet ID."
}

variable "app_subnet_id" {
   type        = string
   description = "The app subnet ID."    
}

variable "recovery_service_vault_name" {
  type        = string
  default     = "recovery-vault"
  description = "Specifies the name of the Recovery Services Vault."
}

variable "recovery_vault_sku" {
  type        = string
  default     = "Standard"
  description = "Specifies the SKU of the Recovery Service."
}

variable "vm_backup_frequency" {
  type        = string
  default     = "Weekly"
  description = "Backup Frequency for a VM. Possible values are Weekly or Daily."
}

variable "vm_backup_policy_name" {
  type        = string
  default     = "vm-backup-policy-weekly"
  description = "Backup Policy Name for a VM."
}

variable "ProjectName" {
  type        = string
  default     = "testproject"
  description = "Project Name for Tag"
}

variable "Department" {
  type        = string
  default     = "testdepartment"
  description = "Department for Tag"
}

variable "CostCenter" {
  type        = string
  default     = "testcostcenter"
  description = "Costcenter for Tag"
}

variable "Criticality" {
  type        = string
  default     = "low"
  description = "Criticality for Tag"
}

variable "BusinessOwnerEmail" {
  type        = string
  default     = "testowner"
  description = "BusinessOwnerEmail for Tag"
}

variable "DevOwnerEmail" {
  type        = string
  default     = "testdevowner"
  description = "DevOwnerEmail for Tag"
}

variable "MaintenanceWindow" {
  type        = string
  default     = "testwindow"
  description = "Maintenance Window for Tag"
}