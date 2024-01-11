terraform {
  required_version = ">= 0.12"
  required_providers {
    azurerm = ">= 3.0.0"
  }
  backend "azurerm" {}
}

provider "azurerm" {
  skip_provider_registration = true
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "rg-networking"
  location = "West Europe"
}

resource "azurerm_virtual_network" "example" {
  name                = "vnet-example"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  address_space       = ["10.0.1.0/24"]
}

output "vnet_address_space" {
  description = "The address space of the Virtual Network"
  value       = azurerm_virtual_network.example.address_space[0]
}
