variable "aks_name" {
  type        = string
  default     = "testaks123"
  description = "The name of the AKS cluster"
}

variable "resource_group_name" {
  type        = string
  default     = "testrg"
  description = "The name of the resource group in which to create AKS"
}

variable "location" {
  type        = string
  default     = "westeurope"
  description = "Specifies the supported Azure location where the resource exists."
}

variable "aks_dns_prefix" {
  type        = string
  default     = "testdns123"
  description = "DNS prefix specified when creating the managed cluster. The dns_prefix must contain between 3 and 45 characters, and can contain only letters, numbers, and hyphens. It must start with a letter and must end with a letter or a number."
}

variable "aks_version" {
  type        = string
  default     = "1.22.6"
  description = "Version of Kubernetes specified when creating the AKS managed cluster."
}

variable "aks_default_node_pool_name" {
  type        = string
  default     = "aksnodepool"
  description = "The name which should be used for the default Kubernetes Node Pool."
}

variable "aks_default_node_pool_count" {
  type        = number
  default     = 1
  description = "The initial number of nodes which should exist in this Node Pool."
}

variable "aks_default_node_pool_vm_size" {
  type        = string
  default     = "Standard_DS2_v2"
  description = "The size of the Virtual Machine, such as Standard_DS2_v2"
}

variable "aks_disk_size_gb" {
  type        = number
  default     = 128
  description = "The size of the OS Disk in GB which should be used for each agent in the Node Pool."
}

variable "aks_rbac_enabled" {
  type        = bool
  default     = true
  description = "Is Role Based Access Control Enabled, options are true or false"
}

variable "enable_host_encryption" {
  type        = bool
  default     = false
  description = "Should the nodes in the Default Node Pool have host encryption enabled? Available options are true or false"
}

variable "max_pods" {
  type        = number
  default     = 30
  description = "The maximum number of pods that can run on each agent."
}

variable "network_plugin" {
  type        = string
  default     = "azure"
  description = "Network plugin to use for networking. Currently supported values are azure and kubenet."
}

variable "pod_cidr" {
  type        = string
  default     = ""
  description = "The CIDR to use for pod IP addresses. This field can only be set when network_plugin is set to kubenet."
}

variable "enable_auto_scaling" {
  type        = bool
  default     = false
  description = "Should the Kubernetes Auto Scaler be enabled for this Node Pool? Possible values are true or false"
}

variable "auto_scaling_min_node_count" {
  type        = number
  default     = null
  description = "The minimum number of nodes which should exist in this Node Pool. If specified this must be between 1 and 1000."
}

variable "auto_scaling_max_node_count" {
  type        = number
  default     = null
  description = "The maximum number of nodes which should exist in this Node Pool. If specified this must be between 1 and 1000."
}

variable "aks_admin_username" {
  type        = string
  default     = "aks_admin"
  description = "The Admin Username for the Cluster."
}

variable "aks_sku_tier" {
  type        = string
  default     = "Free"
  description = "The SKU Tier that should be used for this Kubernetes Cluster. Possible values are Free and Paid (which includes the Uptime SLA)."
}

variable "private_cluster_enabled" {
  type        = bool
  default     = false
  description = "Should this Kubernetes Cluster have its API server only exposed on internal IP addresses? This provides a Private IP Address for the Kubernetes API on the Virtual Network where the Kubernetes Cluster is located."
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
