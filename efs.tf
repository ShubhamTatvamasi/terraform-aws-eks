resource "aws_efs_file_system" "eks" {
  tags = {
    Name = "MyEFS"
  }
}

resource "aws_efs_mount_target" "eks_mnt_0" {
  file_system_id = aws_efs_file_system.eks.id
  subnet_id      = data.aws_subnets.default.ids.0
  security_groups = [module.eks_cluster.cluster_security_group_id]
}

resource "aws_efs_mount_target" "eks_mnt_1" {
  file_system_id = aws_efs_file_system.eks.id
  subnet_id      = data.aws_subnets.default.ids.1
  security_groups = [module.eks_cluster.cluster_security_group_id]
}

resource "aws_efs_mount_target" "eks_mnt_2" {
  file_system_id = aws_efs_file_system.eks.id
  subnet_id      = data.aws_subnets.default.ids.2
  security_groups = [module.eks_cluster.cluster_security_group_id]
}
