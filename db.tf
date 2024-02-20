resource "azurerm_postgresql_flexible_server" "cyf_videos" {
  name                = "cyf-videos"
  resource_group_name = azurerm_resource_group.cyf-videos.name
  location            = azurerm_resource_group.cyf-videos.location

  administrator_login    = "postgres"
  administrator_password = var.db_password

  sku_name   = "B_Standard_B1ms"
  version    = "16"
  storage_mb = 32768
  zone       = "1"

  backup_retention_days        = 7
  geo_redundant_backup_enabled = false
  auto_grow_enabled            = false
}