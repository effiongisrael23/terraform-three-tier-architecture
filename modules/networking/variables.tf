variable "location" {
  type        = string
  description = "The name of location where resource needs to be provisioned."
}

variable "resource_group_name" {
  type        = string
  default     = "testrg"
  description = "The name of the Resource Group in which the resource should be exist."
}

variable "vnet_name" {
  type        = string
  default     = "test-vnet"
  description = "Provide list of maps of vnets to be created."
}

variable "web_vnet_name" {
  type        = string
  default     = "test-web-subnet"
  description = "Provide list of maps of subnets to be created."
}

variable "app_vnet_name" {
  type        = string
  default     = "test-app-subnet"
  description = "Provide list of maps of subnets to be created."
}

variable "db_vnet_name" {
  type        = string
  default     = "test-db-subnet"
  description = "Provide list of maps of subnets to be created."
}

variable "vnetcidr" {
  type        = list(any)
  default     = ["192.168.0.0/16"]
  description = "Provide list of maps of vnets to be created."  
}

variable "websubnetcidr" {
  type        = list(any)
  default     = ["192.168.1.0/24"]
  description = "Provide list of maps of web subnets to be created."
}

variable "appsubnetcidr" {
  type        = list(any)
  default     = ["192.168.2.0/24"]
  description = "Provide list of maps of app subnets to be created."
}

variable "dbsubnetcidr" {
  type        = list(any)
  default     = ["192.168.3.0/24"]
  description = "Provide list of maps of db subnets to be created."
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

