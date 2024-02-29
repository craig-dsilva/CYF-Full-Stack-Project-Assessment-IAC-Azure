resource "azurerm_lb" "cyf_videos" {
  name                = "cyf-videos"
  resource_group_name = azurerm_resource_group.cyf-videos.name
  location            = azurerm_resource_group.cyf-videos.location

  frontend_ip_configuration {
    name                 = "cyf-videos"
    public_ip_address_id = azurerm_public_ip.cyf_videos_lb.id
  }

  tags = {
    "Name" = "cyf-videos-lb"
  }
}

resource "azurerm_public_ip" "cyf_videos_lb" {
  name                = "cyf-videos-lb"
  resource_group_name = azurerm_resource_group.cyf-videos.name
  location            = azurerm_resource_group.cyf-videos.location
  allocation_method   = "Dynamic"

  domain_name_label = "videorecommendationslb"
}
