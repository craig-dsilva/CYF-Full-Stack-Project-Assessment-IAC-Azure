resource "azurerm_virtual_network" "cyf_videos" {
  name                = "cyf-videos"
  resource_group_name = azurerm_resource_group.cyf-videos.name
  location            = azurerm_resource_group.cyf-videos.location
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "cyf_videos" {
  name                 = "cyf-videos"
  virtual_network_name = azurerm_virtual_network.cyf_videos.name
  resource_group_name  = azurerm_resource_group.cyf-videos.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_network_interface" "cyf_videos_server" {
  name                = "cyf-videos-server"
  resource_group_name = azurerm_resource_group.cyf-videos.name
  location            = azurerm_resource_group.cyf-videos.location

  ip_configuration {
    name                          = "cyf-videos-server"
    subnet_id                     = azurerm_subnet.cyf_videos.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.cyf_videos_server_public_ip.id
  }
}

resource "azurerm_public_ip" "cyf_videos_server_public_ip" {
  name                = "cyf_videos_public_ip"
  resource_group_name = azurerm_resource_group.cyf-videos.name
  location            = azurerm_resource_group.cyf-videos.location
  allocation_method   = "Dynamic"
  domain_name_label   = "videorecommendations"
}