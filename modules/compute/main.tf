
resource "azurerm_resource_group" "rg" {
  name     = "rg-${var.env_name}"
  location = "East US"
}
