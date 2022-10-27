resource "helm_release" "aws_efs_csi_driver" {
  count = var.deploy_efs ? 1 : 0

  name             = "aws-efs-csi-driver"
  chart            = "aws-efs-csi-driver"
  repository       = "https://kubernetes-sigs.github.io/aws-efs-csi-driver"
  version          = "2.2.9"
  namespace        = var.efs_namespace
  create_namespace = true

  values = [<<VALUES
  controller:
    serviceAccount:
      create: true
      name: ${var.efs_service_account}
      annotations:
        eks.amazonaws.com/role-arn: ${aws_iam_role.efs_csi_driver.0.arn}
  node:
    serviceAccount:
      create: false
      name: ${var.efs_service_account}
      annotations:
        eks.amazonaws.com/role-arn: ${aws_iam_role.efs_csi_driver.0.arn}
  storageClasses:
    - name: efs-sc
      parameters:
        provisioningMode: efs-ap
        fileSystemId: ${aws_efs_file_system.eks.0.id}
        directoryPerms: "700"
  VALUES
  ]
}
