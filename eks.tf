module "eks_managed_node_group" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 18.0"

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version

  vpc_id = data.aws_vpc.default.id
  subnet_ids = [
    data.aws_subnets.default.ids.0,
    data.aws_subnets.default.ids.1,
    data.aws_subnets.default.ids.2
  ]

  eks_managed_node_groups = {
    worker_nodes = {
      min_size     = var.worker_nodes_min_size
      max_size     = var.worker_nodes_max_size
      desired_size = var.worker_nodes_desired_size

      instance_types = var.instance_types
      capacity_type  = var.capacity_type

      disk_size = var.disk_size
    }
  }
}
