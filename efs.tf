resource "aws_efs_file_system" "eks_pv" {
  tags = {
    Name = "MyEFS"
  }
}

resource "aws_efs_mount_target" "eks_pv_mnt" {
  file_system_id = aws_efs_file_system.eks_pv.id
  subnet_id      = data.aws_subnets.default.ids.0
}
