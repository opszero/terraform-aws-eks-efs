
variable "name" {
  default     = ""
  description = "EFS file system bame"
}

variable "path" {
  default     = ""
  description = "EFS file system path"
}

variable "subnet_ids" {
  default     = ""
  description = "Subnet ID from Kubernetes VPC"
}

variable "node_security_group_ids" {
  default     = ""
  description = "Kubernetes node security group id"
}

variable "tags" {
  default     = {}
  description = "Tags to apply to all resources"
}
