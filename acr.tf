resource "azurerm_container_registry" "cyf_videos" {
  name                = "cyfvideos"
  resource_group_name = azurerm_resource_group.cyf-videos.name
  location            = azurerm_resource_group.cyf-videos.location
  sku                 = "Standard"
  admin_enabled       = true

  tags = {
    Name = "cyf-videos-image"
  }
}