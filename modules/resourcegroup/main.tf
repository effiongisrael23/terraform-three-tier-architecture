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

resource "azurerm_resource_group" "resource_group" {
  name     = var.resource_group_name
  location = var.location
  tags     = local.tags
}
