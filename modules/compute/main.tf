# Creating tags as local variable
locals {
  tags = {
    ProjectName        = var.ProjectName
    Department         = var.Department
    Criticality        = var.Criticality
    BusinessOwnerEmail = var.BusinessOwnerEmail
    DevOwnerEmail      = var.DevOwnerEmail
    MaintenanceWindow  = var.MaintenanceWindow
  }
}

# NIC for the Web VM
resource "azurerm_network_interface" "web_vm_nic" {
  name                = format("%s-%s", var.web_vm_name, "NIC")
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = format("%s-%s", var.web_vm_name, "PRV-IP")
    subnet_id                     = var.web_subnet_id
    private_ip_address_allocation = "Dynamic"
    }

    tags = local.tags
}

# Generate random password for linux vm
resource "random_password" "linux_password" {
  length           = 13
  special          = true
  upper            = true
  number           = true
  lower            = true
  override_special = "_%@+"
}

# Provision Linux VM for Web
resource "azurerm_linux_virtual_machine" "web_linux_vm" {
  name                            = var.web_vm_name
  location                        = var.location
  resource_group_name             = var.resource_group_name
  admin_username                  = var.vm_username
  admin_password                  = random_password.linux_password.result
  size                            = var.vm_size
  disable_password_authentication = false
  computer_name                   = var.web_host_name

  network_interface_ids = [ azurerm_network_interface.web_vm_nic.id ]
  
  source_image_reference {
    publisher = var.vm_image_publisher
    offer     = var.vm_image_offer
    sku       = var.vm_image_sku
    version   = var.vm_image_version
  }

  os_disk {
    name                 = format("%s-%s", var.web_vm_name, "os-disk")
    caching              = var.vm_os_disk_caching
    storage_account_type = var.vm_os_disk_storage_account_type
    disk_size_gb         = var.vm_os_disk_size_gb
  }

  tags = local.tags
 
}

# Create Recovery Services Vault for the VM Backup
resource "azurerm_recovery_services_vault" "vm_recovery_vault" {
  name                = var.recovery_service_vault_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.recovery_vault_sku
  tags                = local.tags
}

# Weekly Backup policy for the VM
resource "azurerm_backup_policy_vm" "vm_backup_policy_weekly" {
  name                = var.vm_backup_policy_name
  resource_group_name = var.resource_group_name
  recovery_vault_name = azurerm_recovery_services_vault.vm_recovery_vault.name
  timezone            = "UTC"

  backup {
    frequency = var.vm_backup_frequency
    time      = "05:30"
    weekdays  = ["Saturday"]
  }

  retention_weekly {
    count    = 90
    weekdays = ["Saturday"]
  }
}

# Attach the Backup Policy and Recovery Vault with the Web VM
resource "azurerm_backup_protected_vm" "web_vm_backup" {
  resource_group_name = var.resource_group_name
  recovery_vault_name = azurerm_recovery_services_vault.vm_recovery_vault.name
  source_vm_id        = azurerm_linux_virtual_machine.web_linux_vm.id
  backup_policy_id    = azurerm_backup_policy_vm.vm_backup_policy_weekly.id
}

# NIC for the App VM
resource "azurerm_network_interface" "app_vm_nic" {
  name                = format("%s-%s", var.app_vm_name, "NIC")
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = format("%s-%s", var.app_vm_name, "PRV-IP")
    subnet_id                     = var.app_subnet_id
    private_ip_address_allocation = "Dynamic"
    }

    tags = local.tags
}

# Provision Linux VM for Application
resource "azurerm_linux_virtual_machine" "app_linux_vm" {
  name                            = var.app_vm_name
  location                        = var.location
  resource_group_name             = var.resource_group_name
  admin_username                  = var.vm_username
  admin_password                  = random_password.linux_password.result
  size                            = var.vm_size
  disable_password_authentication = false
  computer_name                   = var.app_host_name

  network_interface_ids = [ azurerm_network_interface.app_vm_nic.id ]
  
  source_image_reference {
    publisher = var.vm_image_publisher
    offer     = var.vm_image_offer
    sku       = var.vm_image_sku
    version   = var.vm_image_version
  }

  os_disk {
    name                 = format("%s-%s", var.app_vm_name, "os-disk")
    caching              = var.vm_os_disk_caching
    storage_account_type = var.vm_os_disk_storage_account_type
    disk_size_gb         = var.vm_os_disk_size_gb
  }

  tags = local.tags
 
}

# Attach the Backup Policy and Recovery Vault with the App VM
resource "azurerm_backup_protected_vm" "app_vm_backup" {
  resource_group_name = var.resource_group_name
  recovery_vault_name = azurerm_recovery_services_vault.vm_recovery_vault.name
  source_vm_id        = azurerm_linux_virtual_machine.app_linux_vm.id
  backup_policy_id    = azurerm_backup_policy_vm.vm_backup_policy_weekly.id
}

