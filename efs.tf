resource "aws_efs_file_system" "this" {
  creation_token = var.name
  tags = merge(
    var.tags,
    {
      Name = var.name
  })
}

resource "aws_efs_mount_target" "this" {
  count           = length(var.subnet_ids)
  file_system_id  = aws_efs_file_system.this.id
  subnet_id       = var.subnet_ids[count.index]
  security_groups = var.security_group_ids
}

resource "kubernetes_storage_class_v1" "this" {
  metadata {
    name = var.name
  }
  storage_provisioner = "efs.csi.aws.com"
  parameters = {
    provisioningMode = "efs-ap"
    fileSystemId     = aws_efs_file_system.this.id
    directoryPerms   = "777"
    gidRangeStart    = "1000"    # optional
    gidRangeEnd      = "7000000" # optional
  }
}
