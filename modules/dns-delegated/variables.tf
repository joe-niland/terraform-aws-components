variable "region" {
  type        = string
  description = "AWS Region"
}

variable "zone_config" {
  description = "Zone config"
  type = list(object({
    subdomain = string
    zone_name = string
  }))
}

variable "aws_shield_protection_enabled" {
  description = "Enable or disable AWS Shield Advanced protection for Route53 Zones. If set to 'true', a subscription to AWS Shield Advanced must exist in this account."
  type        = bool
  default     = false
}

variable "dns_private_zone_enabled" {
  type        = bool
  description = "Whether to set the zone to public or private"
  default     = false
}

variable "vpc_primary_environment_name" {
  description = "The name of the environment where primary VPC is deployed"
  type        = string
  default     = null
}

variable "vpc_secondary_environment_names" {
  description = "The names of the environments where secondary VPCs are deployed"
  type        = list(string)
  default     = []
}

variable "vpc_region_abbreviation_type" {
  type        = string
  description = "Type of VPC abbreviation (either `fixed` or `short`) to use in names. See https://github.com/cloudposse/terraform-aws-utils for details."
  default     = "fixed"
  validation {
    condition     = contains(["fixed", "short"], var.vpc_region_abbreviation_type)
    error_message = "The vpc_region_abbreviation_type must be either \"fixed\" or \"short\"."
  }
}

variable "certificate_authority_enabled" {
  type        = bool
  description = "Whether to use the certificate authority or not"
  default     = false
}

variable "certificate_authority_component_name" {
  type        = string
  default     = null
  description = "Use this component name to read from the remote state to get the certificate_authority_arn if using an authority type of SUBORDINATE"
}

variable "certificate_authority_stage_name" {
  type        = string
  default     = null
  description = "Use this stage name to read from the remote state to get the certificate_authority_arn if using an authority type of SUBORDINATE"
}

variable "certificate_authority_environment_name" {
  type        = string
  default     = null
  description = "Use this environment name to read from the remote state to get the certificate_authority_arn if using an authority type of SUBORDINATE"
}

variable "certificate_authority_component_key" {
  type        = string
  default     = null
  description = "Use this component key e.g. `root` or `mgmt` to read from the remote state to get the certificate_authority_arn if using an authority type of SUBORDINATE"
}
