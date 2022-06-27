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

# Generate ssh key content
resource "tls_private_key" "kubernetes_ssh_key" {
  algorithm = "RSA"
}

# AKS resource
resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.aks_dns_prefix
  kubernetes_version  = var.aks_version

  identity {
    type = "SystemAssigned"
  }

  default_node_pool {
    name                   = var.aks_default_node_pool_name
    node_count             = var.aks_default_node_pool_count
    vm_size                = var.aks_default_node_pool_vm_size
    enable_host_encryption = var.enable_host_encryption
    os_disk_size_gb        = var.aks_disk_size_gb
    max_pods               = var.max_pods
    enable_auto_scaling    = var.enable_auto_scaling
    min_count              = var.enable_auto_scaling == true ? var.auto_scaling_min_node_count : null
    max_count              = var.enable_auto_scaling == true ? var.auto_scaling_max_node_count : null
  }

  linux_profile {
    admin_username = var.aks_admin_username
    ssh_key {
      key_data = tls_private_key.kubernetes_ssh_key.public_key_openssh
    }
  }

  private_cluster_enabled = var.private_cluster_enabled
  sku_tier                = var.aks_sku_tier

  network_profile {
    network_plugin = var.network_plugin
    network_policy = var.network_plugin == "azure" ? "azure" : null
    pod_cidr       = var.network_plugin == "kubenet" ? var.pod_cidr : null
  }

  tags = local.tags
}
