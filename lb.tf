resource "azurerm_lb" "cyf_videos" {
  name                = "cyf-videos"
  resource_group_name = azurerm_resource_group.cyf-videos.name
  location            = azurerm_resource_group.cyf-videos.location
  sku                 = "Standard"
}

resource "azurerm_lb_backend_address_pool" "cyf_videos" {
  loadbalancer_id = azurerm_lb.cyf_videos.id
  name            = "cyf_videos"
}