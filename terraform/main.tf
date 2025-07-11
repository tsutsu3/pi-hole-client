locals {
  tags = {
    environment = "development"
    created_by  = "terraform"
    project     = "pi-hole-client"
  }

  os_type = "Linux"
}

module "naming" {
  source  = "Azure/naming/azurerm"
  version = "~> 0.4.2"
  prefix  = [var.environment]
}

module "rg" {
  source  = "Azure/avm-res-resources-resourcegroup/azurerm"
  version = "~> 0.2.1"

  location = var.location
  name     = module.naming.resource_group.name_unique

  enable_telemetry = false
  tags             = local.tags
}

module "asp" {
  source  = "Azure/avm-res-web-serverfarm/azurerm"
  version = "~> 0.7.0"

  resource_group_name = module.rg.name
  location            = var.location

  name                   = module.naming.app_service_plan.name_unique
  sku_name               = "F1"
  os_type                = local.os_type
  zone_balancing_enabled = false
  worker_count           = 1

  enable_telemetry = false
  tags             = local.tags
}

module "app" {
  source  = "Azure/avm-res-web-site/azurerm"
  version = "~> 0.17.2"

  resource_group_name = module.rg.name
  location            = var.location

  name                                     = module.naming.app_service.name_unique
  os_type                                  = local.os_type
  kind                                     = "webapp"
  service_plan_resource_id                 = module.asp.resource_id
  enable_application_insights              = false
  ftp_publish_basic_authentication_enabled = false
  site_config = {
    always_on         = false
    worker_count      = 1
    use_32_bit_worker = true
    application_stack = {
      docker = {
        docker_image_name   = "pihole/pihole:${var.pihole_version}"
        docker_registry_url = "https://index.docker.io"
      }
    }
    ip_restriction_default_action = length(var.ip_restriction) > 0 ? "Deny" : "Allow"
    ip_restriction                = var.ip_restriction
  }
  app_settings = {
    TZ                             = var.timezone
    FTLCONF_webserver_api_password = var.password
  }

  enable_telemetry = false
  tags             = local.tags
}
