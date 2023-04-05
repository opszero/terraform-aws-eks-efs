variable "name" {
  default     = ""
  description = "EFS file system bame"
}

variable "subnet_ids" {
  default     = ""
  description = "Subnet ID from Kubernetes VPC"
}

variable "security_group_ids" {
  default     = []
  description = "Kubernetes node security group id"
}

variable "tags" {
  default     = {}
  description = "Tags to apply to all resources"
}
