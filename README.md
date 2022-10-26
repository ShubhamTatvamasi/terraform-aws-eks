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

# k8s

Create a volume claim:
```bash
curl -sL https://k8s.io/examples/pods/storage/pv-claim.yaml \
  | sed 's/manual/efs-sc/' | kubectl apply -f -
```

Create a pod:
```bash
kubectl apply -f https://k8s.io/examples/pods/storage/pv-pod.yaml
```
