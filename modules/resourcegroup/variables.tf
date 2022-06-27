variable "resource_group_name" {
  type        = string
  default     = "testrg"
  description = "The name of the resource group in which to create the resource."
}

variable "location" {
  type        = string
  default     = "westeurope"
  description = "Specifies the supported Azure location where the resource exists."
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