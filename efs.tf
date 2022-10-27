resource "aws_efs_file_system" "eks" {
  count = var.deploy_efs ? 1 : 0

  tags = {
    Name = "${var.cluster_name}-EFS"
  }
}

resource "aws_efs_mount_target" "subnet_0" {
  count = var.deploy_efs ? 1 : 0

  file_system_id  = aws_efs_file_system.eks.0.id
  subnet_id       = data.aws_subnets.default.ids.0
  security_groups = [aws_security_group.efs.0.id]
}

resource "aws_efs_mount_target" "subnet_1" {
  count = var.deploy_efs ? 1 : 0

  file_system_id  = aws_efs_file_system.eks.0.id
  subnet_id       = data.aws_subnets.default.ids.1
  security_groups = [aws_security_group.efs.0.id]
}

resource "aws_efs_mount_target" "subnet_2" {
  count = var.deploy_efs ? 1 : 0

  file_system_id  = aws_efs_file_system.eks.0.id
  subnet_id       = data.aws_subnets.default.ids.2
  security_groups = [aws_security_group.efs.0.id]
}
