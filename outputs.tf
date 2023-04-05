output "kubernetes_storage_class_name" {
  value = kubernetes_storage_class_v1.this.metadata.name
}
