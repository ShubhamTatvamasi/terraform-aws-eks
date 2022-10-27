# terraform-aws-eks

Initalize Terraform:
```bash
terraform init -upgrade
```

Deploy cluster:
```bash
# Set your region.
export TF_VAR_region=ap-south-1

# Set this if you want to use this for testing, so it will be you temp instance with 70% discount.
export TF_VAR_capacity_type=SPOT

terraform apply -auto-approve
```

Update kubeconfig:
```bash
aws eks update-kubeconfig \
  --name $(terraform output -raw cluster_name) \
  --region $(terraform output -raw region)
```

Destroy cluster:
```bash
terraform destroy -auto-approve
```
