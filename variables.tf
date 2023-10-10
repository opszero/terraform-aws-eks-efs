variable "name" {
  description = "EFS file system name"
}

variable "subnet_ids" {
  default     = []
  type        = list(list(string))
  description = "Subnet ID from Kubernetes VPC"
}

variable "security_group_ids" {
  default     = []
  description = "Kubernetes node security group id"
}

variable "vpc_id" {
  default     = ""
  description = "EKS cluster vpc id"
}

variable "vpc_cidr_block" {
  default     = ""
  description = "VPC CIDR block for allowing access in efs system"
}

variable "efs_storage_size" {
  default     = "5Gi"
  description = "Storage requested by kubernetes"
}

variable "efs_pvc_namespace" {
  default     = "default"
  description = "The namespace of PVC should be deployed"
}

variable "tags" {
  default     = {}
  description = "Tags to apply to all resources"
}
