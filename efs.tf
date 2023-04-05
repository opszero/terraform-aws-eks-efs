resource "aws_efs_file_system" "efs-file-system" {
  creation_token = var.aws_efs_file_system_name

  tags = {
    Name = "efs-monitoring"
  }
}

resource "aws_efs_mount_target" "efs-file-system" {
  file_system_id  = aws_efs_file_system.efs-file-system.id
  subnet_id       = var.subnet_id
  security_groups = var.node_security_group_id
}


resource "kubernetes_storage_class_v1" "efs-storage-class" {
  metadata {
    name = var.aws_efs_file_system_name
  }
  storage_provisioner = "efs.csi.aws.com"
  parameters = {
    provisioningMode = "efs-ap"
    fileSystemId =  aws_efs_file_system.efs-file-system.id
    directoryPerms = "700"
    gidRangeStart = "1000" # optional
    gidRangeEnd = "2000" # optional
    basePath = "/dynamic_provisioning" # optional
  }
}

variable "aws_efs_file_system_name" {
  default = ""
  description = "EFS file system bame"
}

variable "subnet_id" {
  default = ""
  description = "Subnet ID from Kubernetes VPC"
}

variable "node_security_group_id" {
  default = ""
  description = "Kubernetes node security group id"
}

output "kubernetes_storage_class_name" {
  value = kubernetes_storage_class_v1.efs-storage-class.metadata.name
}
