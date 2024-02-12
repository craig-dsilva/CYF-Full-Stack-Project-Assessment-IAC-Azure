resource "azurerm_static_site" "video_recommendations" {
  name                = "cyf-videos"
  resource_group_name = azurerm_resource_group.cyf-videos.name
  location            = "West Europe"
}