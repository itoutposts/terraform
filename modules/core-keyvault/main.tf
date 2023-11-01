## Azure Key Vault
data "azuread_client_config" "current" {}
resource "azurerm_key_vault" "kv" {
  name                        = var.name
  location                    = var.location
  resource_group_name         = var.resource_group_name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azuread_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false
  sku_name                    = "standard"

  dynamic "network_acls" {
    for_each = var.key-vault-private ? [1] : []

    content {
      bypass                     = var.key-vault-acls-bypass
      default_action             = var.key-vault-acls-default-action
      virtual_network_subnet_ids = var.key-vault-subnet-ids != null ? var.key-vault-subnet-ids : null

      ## ip address whitelisted on KV firewall
      ## https://support.atlassian.com/bitbucket-cloud/docs/what-are-the-bitbucket-cloud-ip-addresses-i-should-use-to-configure-my-corporate-firewall/
      ip_rules = var.ip_rules != null ? var.ip_rules : var.default_ip_rules
    }
  }
}

#}

output "id" {
  value = azurerm_key_vault.kv.id
}

output "vault_uri" {
  value = azurerm_key_vault.kv.vault_uri
}



