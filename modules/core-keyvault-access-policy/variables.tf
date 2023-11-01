variable "key_vault_id" {

}

variable "tenant_id" {

}

variable "object_id" {

}

variable "certificate_permissions" {
  default = [
    "Backup", "Create", "Delete", "DeleteIssuers", "Get", "GetIssuers", "Import", "List", "ListIssuers",
    "ManageContacts", "ManageIssuers", "Purge", "Recover", "Restore", "SetIssuers", "Update"
  ]
}
variable "key_permissions" {
  default = [
    "Backup", "Create", "Decrypt", "Delete", "Encrypt", "Get", "Import", "List", "Purge", "Recover", "Restore", "Sign",
    "UnwrapKey", "Update", "Verify", "WrapKey"
  ]
}

variable "secret_permissions" {
  default = ["Backup", "Delete", "Get", "List", "Purge", "Recover", "Restore", "Set"]
}
variable "storage_permissions" {
  default = [
    "Backup", "Delete", "DeleteSAS", "Get", "GetSAS", "List", "ListSAS", "Purge", "Recover", "RegenerateKey", "Restore",
    "Set", "SetSAS", "Update"
  ]
}