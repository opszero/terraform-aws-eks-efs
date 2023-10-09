variable "name" {
  description = "EFS file system name"
}

variable "subnet_ids" {
  default     = [
  "subnet-05a481d2907856a41",
  "subnet-0bada3c76d8bae888"
  ]
  description = "Subnet ID from Kubernetes VPC"
}

variable "security_group_ids" {
  default     = []
  description = "Kubernetes node security group id"
}

variable "vpc_id" {
  default = ""
  description = "EKS cluster vpc id"
}

variable "vpc_cidr_block" {
  default = ""
  description = "VPC CIDR block for allowing access in efs system"
}

variable "efs_storage_size" {
  default = "5Gi"
  description = "Storage requested by kubernetes"
}

variable "tags" {
  default     = {}
  description = "Tags to apply to all resources"
}
