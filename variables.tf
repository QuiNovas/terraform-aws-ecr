variable "cross_account_users" {
  type        = list(string)
  description = "A list of cross-account users, often the root user of those accounts, to grant access to the ECR repository."
  default     = []
}

variable "name" {
  description = "Name of the repository."
  type        = string
}

