terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.48.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "e7e9c8a1-3a57-431d-a76d-9cf0dcda292b"
}