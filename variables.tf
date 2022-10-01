# Input Variables
# https://www.terraform.io/language/values/variables

variable "billing_account" {
  description = "The alphanumeric ID of the billing account this project belongs to"
  type        = string
  sensitive   = true
}

variable "env" {
  description = "The environment suffix for example: `sb` (Sandbox), `nonprod` (Non-Production), `prod` (Production)"
  type        = string
  default     = "sb"
}

variable "folder_id" {
  description = "The numeric ID of the folder this project should be created under. Only one of `org_id` or `folder_id` may be specified"
  type        = string
}
