locals {
  default_tags = {
    environment = var.environment
    project     = var.project
  }
}

resource "azurerm_resource_group" "azurerm_resource_group" {
  name     = "${var.environment}-rg-${var.project}-${var.region}-aks-${var.prefix}"
  location = var.location
}