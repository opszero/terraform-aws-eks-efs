<!-- BEGIN_TF_DOCS -->

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | n/a |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | EFS file system bame | `string` | `""` | no |
| <a name="input_node_security_group_ids"></a> [node\_security\_group\_ids](#input\_node\_security\_group\_ids) | Kubernetes node security group id | `string` | `""` | no |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | Subnet ID from Kubernetes VPC | `string` | `""` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to apply to all resources | `map` | `{}` | no |
## Resources

| Name | Type |
|------|------|
| [aws_efs_file_system.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/efs_file_system) | resource |
| [aws_efs_mount_target.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/efs_mount_target) | resource |
| [kubernetes_storage_class_v1.this](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/storage_class_v1) | resource |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_kubernetes_storage_class_name"></a> [kubernetes\_storage\_class\_name](#output\_kubernetes\_storage\_class\_name) | n/a |
<!-- END_TF_DOCS -->