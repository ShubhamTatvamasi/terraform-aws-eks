data "aws_iam_policy_document" "efs_csi_driver" {
  count = var.deploy_efs ? 1 : 0

  statement {
    actions = [
      "elasticfilesystem:DescribeAccessPoints",
      "elasticfilesystem:DescribeFileSystems",
      "elasticfilesystem:DescribeMountTargets",
      "ec2:DescribeAvailabilityZones"
    ]
    resources = ["*"]
    effect    = "Allow"
  }

  statement {
    actions = [
      "elasticfilesystem:CreateAccessPoint"
    ]
    resources = ["*"]
    effect    = "Allow"
    condition {
      test     = "StringLike"
      variable = "aws:RequestTag/efs.csi.aws.com/cluster"
      values   = ["true"]
    }
  }

  statement {
    actions = [
      "elasticfilesystem:DeleteAccessPoint"
    ]
    resources = ["*"]
    effect    = "Allow"
    condition {
      test     = "StringEquals"
      variable = "aws:ResourceTag/efs.csi.aws.com/cluster"
      values   = ["true"]
    }
  }
}

resource "aws_iam_policy" "efs_csi_driver" {
  count = var.deploy_efs ? 1 : 0

  name        = "${var.cluster_name}-efs-csi-driver"
  path        = "/"
  description = "Policy for the EFS CSI driver"

  policy = data.aws_iam_policy_document.efs_csi_driver.0.json
}

# Role
data "aws_iam_policy_document" "efs_csi_driver_assume" {
  count = var.deploy_efs ? 1 : 0

  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]

    principals {
      type        = "Federated"
      identifiers = [module.eks.oidc_provider_arn]
    }

    condition {
      test     = "StringEquals"
      variable = "${replace(module.eks.cluster_oidc_issuer_url, "https://", "")}:sub"

      values = [
        "system:serviceaccount:${var.efs_namespace}:${var.efs_service_account}",
      ]
    }

    effect = "Allow"
  }
}

resource "aws_iam_role" "efs_csi_driver" {
  count = var.deploy_efs ? 1 : 0

  name               = "${var.cluster_name}-efs-csi-driver"
  assume_role_policy = data.aws_iam_policy_document.efs_csi_driver_assume.0.json
}

resource "aws_iam_role_policy_attachment" "efs_csi_driver" {
  count = var.deploy_efs ? 1 : 0

  role       = aws_iam_role.efs_csi_driver.0.name
  policy_arn = aws_iam_policy.efs_csi_driver.0.arn
}
