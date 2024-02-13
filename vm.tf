resource "azurerm_linux_virtual_machine" "cyf_videos" {
  name                  = "cyf-videos"
  resource_group_name   = azurerm_resource_group.cyf-videos.name
  location              = azurerm_resource_group.cyf-videos.location
  size                  = "Standard_B2ats_v2"
  admin_username        = "videos"
  network_interface_ids = [azurerm_network_interface.cyf_videos_server.id, ]

  admin_ssh_key {
    username   = "videos"
    public_key = file("~/.ssh/cyf_videos.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  tags = {
    "Name" = "cyf-videos-server"
  }
}

resource "azurerm_network_security_group" "cyf_videos" {
  name = "cyf-videos"
  resource_group_name = azurerm_resource_group.cyf-videos.name
  location = azurerm_resource_group.cyf-videos.location
}

resource "azurerm_network_interface_security_group_association" "cyf_videos" {
  network_interface_id = azurerm_network_interface.cyf_videos_server.id
  network_security_group_id = azurerm_network_security_group.cyf_videos.id
}