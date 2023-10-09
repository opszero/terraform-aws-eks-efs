resource "aws_efs_file_system" "this" {
  creation_token = var.name

  encrypted        = true
  performance_mode = "generalPurpose"
  throughput_mode  = "bursting"

  tags = {
    Name        = "${var.name}-eks-efs"
    Environment = var.name
  }
}

resource "aws_efs_mount_target" "this" {
  count = length(var.subnet_ids)

  file_system_id  = aws_efs_file_system.this.id
  subnet_id       = var.subnet_ids[count.index]
  security_groups = [aws_security_group.this.id]
}


resource "aws_security_group" "this" {
  vpc_id = var.vpc_id

  ingress {
    from_port   = 2049
    to_port     = 2049
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr_block]
  }

  tags = {
    Name        = "${var.name}-eks-efs-sg"
    Environment = var.name
  }
}

resource "kubernetes_storage_class" "this" {
  metadata {
    name = "efs-sc"
  }

  storage_provisioner = "efs.csi.aws.com"
}

resource "kubernetes_persistent_volume" "this" {
  metadata {
    name = "efs-pvc"
  }

  spec {
    capacity = {
      storage = var.efs_storage_size
    }

    volume_mode                      = "Filesystem"
    access_modes                     = ["ReadWriteMany"]
    persistent_volume_reclaim_policy = "Retain"
    storage_class_name               = kubernetes_storage_class.this.metadata[0].name

    persistent_volume_source {
      csi  {
      driver        = "efs.csi.aws.com"
      volume_handle = aws_efs_file_system.this.id
    }
    }

  }
}

#resource "kubernetes_persistent_volume_claim" "this" {
#  metadata {
#    name = "efs-storage-claim"
#    namespace = "mageai"
#  }
#
#  spec {
#    access_modes       = ["ReadWriteMany"]
#    storage_class_name = kubernetes_storage_class.this.metadata[0].name
#
#    resources {
#      requests = {
#        storage = var.efs_storage_size
#      }
#    }
#  }
#}
