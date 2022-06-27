variable "primary_database_password" {}

variable "mssql_server_name" {
  type        = string
  default     = "testmssql123"
  description = "The name of the Microsoft SQL Server. This needs to be globally unique within Azure."
}

variable "resource_group_name" {
  type        = string
  default     = "testrg"
  description = "The name of the resource group in which to create the Microsoft SQL Server."
}

variable "location" {
  type        = string
  description = "Specifies the supported Azure location where the resource exists."
}

variable "admin_username" {
  type        = string
  default     = "SqlAdmin"
  description = "The administrator login username for the new server."
  }

variable "administrator_login_password" {
  type        = string
  default     = "pa$$w0rd@123"
  description = "The administrator login password for the new server."
  }
  

variable "mssql_server_version" {
  type        = string
  default     = "12.0"
  description = "The version for the new server. Valid values are: 2.0 (for v11 server) and 12.0 (for v12 server)"
}

variable "minimum_tls_version" {
  type        = string
  default     = "1.2"
  description = "The Minimum TLS Version for all SQL Database and SQL Data Warehouse databases associated with the server. Valid values are: 1.0, 1.1 and 1.2"
}

variable "public_network_access_enabled" {
  type        = bool
  default     = true
  description = "Whether or not public network access is allowed for this server."
}

variable "mssql_database_name" {
  type        = string
  default     = "testmssqldatabase123"
  description = "The name of the Microsoft SQL database. This needs to be globally unique within Azure."
}

variable "mssql_database_collation" {
  type        = string
  default     = "SQL_Latin1_General_CP1_CI_AS"
  description = "Specifies the collation of the database."
}

variable "mssql_database_max_size_gb" {
  type        = number
  default     = 250
  description = "The max size of the database in gigabytes."
}

variable "mssql_database_sku_name" {
  type        = string
  default     = "S1"
  description = "Specifies the name of the sku used by the database. Changing this forces a new resource to be created. For example, GP_S_Gen5_2,HS_Gen4_1,BC_Gen5_2, ElasticPool, Basic,S0, P2 ,DW100c, DS100."
}

variable "mssql_database_geo_backup_enabled" {
  type        = bool
  default     = false
  description = "A boolean that specifies if the Geo Backup Policy is enabled."
}

variable "mssql_database_zone_redundant" {
  type        = bool
  default     = false
  description = "Whether or not this database is zone redundant, which means the replicas of this database will be spread across multiple availability zones. This property is only settable for Premium and Business Critical databases."
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
