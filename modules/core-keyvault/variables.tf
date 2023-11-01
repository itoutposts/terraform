variable "environment" {}
variable "project" {}
variable "region" {}
variable "location" {}
variable "name" {}
variable "resource_group_name" {}
variable "key-vault-private" {
  type        = bool
  default     = false
  description = "To setup Key Vault behind subnet and Atlassian IPs, if set to 'yes' it will set it up, otherwise it will be opened to the public."
}

variable "key-vault-acls-bypass" {
  type        = string
  default     = "AzureServices"
  description = "Specifies which traffic can bypass the network rules"
}

variable "key-vault-acls-default-action" {
  type        = string
  default     = "Deny"
  description = "The Default Action to use when no rules match from ip_rules / virtual_network_subnet_ids"
}

variable "key-vault-subnet-ids" {
  default     = null
  description = "One or more Subnet IDs which should be able to access the Key Vault"
  type        = list(string) #string
}

variable "ip_rules" {
  description = "IP rules for key vault if it is needed"
  default     = null
}

variable "default_ip_rules" {
  default = []
  description = "Default set of bitbucket ip addresses"
}
