provider "azurerm" {
  features {}
}

module "resourcegroup" {
  source         = "./modules/resourcegroup"
}

module "networking" {
  source         = "./modules/networking"
  location       = module.resourcegroup.location_id
}

module "securitygroup" {
  source         = "./modules/securitygroup"
  # location       = module.resourcegroup.location_id
  # resource_group = module.resourcegroup.resource_group_name 
   web_subnet_id  = module.networking.websubnet_id
   app_subnet_id  = module.networking.appsubnet_id
}

module "compute" {
  source          = "./modules/compute"
  web_subnet_id   = module.networking.websubnet_id
  app_subnet_id   = module.networking.appsubnet_id

}

module "database" {
  source                    = "./modules/database"
  location                  = module.resourcegroup.location_id
  primary_database_password = var.administrator_login_password
}

module "backend" {
  source                    = "./modules/backend"
  location                  = module.resourcegroup.location_id
}