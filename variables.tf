variable "cross_account_users" {
  type        = list(string)
  description = "A list of cross-account users, often the root user of those accounts, to grant access to the ECR repository."
  default     = []
}

variable "name" {
  description = "Name of the repository."
  type        = string
}

variable "tags" {
  description = "A map of key and values"
  type        = map(string)
  default     = {}
}

variable "image_tag_mutability" {
  description = "The tag mutability setting for the repository. Must be one of: MUTABLE or IMMUTABLE"
  type        = string
  default     = "MUTABLE"
}

variable "scan_on_push" {
  description = " Indicates whether images are scanned after being pushed to the repository (true) or not scanned (false)"
  type        = string
  default     = false
}

variable "encryption_type" {
  description = "The encryption type to use for the repository. Valid values are AES256 or KMS. Defaults to AES256"
  type        = string
  default     = "AES256"
}

variable "kms_key" {
  description = "The ARN of the KMS key to use when encryption_type is KMS. If not specified, uses the default AWS managed key for ECR"
  type        = string
  default     = ""
}