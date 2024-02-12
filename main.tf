terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.91.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "cyf-videos"
    storage_account_name = "cyfvideostfstate"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  skip_provider_registration = true
  features {

  }
}

resource "azurerm_resource_group" "cyf-videos" {
  name     = "cyf-videos"
  location = "UK South"
}