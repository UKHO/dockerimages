provider "azurerm" {
  features = {}
  alias = "test"
}

resource "azurerm_resource_group" "rg" {
  name = "rg"
  location = "UKSouth"
}

module "spokesetup_prd" {
  source     = "github.com/ukho/tfmodule-azure-vnet-with-nsg"
  providers = {
    azurerm.src = azurerm.test
  }
  resource_group    = azurerm_resource_group.rg
}
