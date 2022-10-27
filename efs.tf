resource "aws_efs_file_system" "eks_pv" {
  tags = {
    Name = "MyEFS"
  }
}

resource "aws_efs_mount_target" "eks_pv_mnt_0" {
  file_system_id = aws_efs_file_system.eks_pv.id
  subnet_id      = data.aws_subnets.default.ids.0
  security_groups = [module.eks_cluster.cluster_security_group_id]
}

resource "aws_efs_mount_target" "eks_pv_mnt_1" {
  file_system_id = aws_efs_file_system.eks_pv.id
  subnet_id      = data.aws_subnets.default.ids.1
  security_groups = [module.eks_cluster.cluster_security_group_id]
}

resource "aws_efs_mount_target" "eks_pv_mnt_2" {
  file_system_id = aws_efs_file_system.eks_pv.id
  subnet_id      = data.aws_subnets.default.ids.2
  security_groups = [module.eks_cluster.cluster_security_group_id]
}
