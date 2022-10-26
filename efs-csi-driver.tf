resource "helm_release" "efs_csi_driver" {
  name       = "aws-efs-csi-driver"
  repository = "https://kubernetes-sigs.github.io/aws-efs-csi-driver"
  chart      = "aws-efs-csi-driver"
  version    = "2.2.9"
  namespace  = "kube-system"

  values = [<<VALUES
  controller:
    serviceAccount:
      name: "aws-efs-csi-driver"
      annotations:
        eks.amazonaws.com/role-arn: ${aws_iam_role.efs_csi_driver.arn}
  node:
    serviceAccount:
      name: "aws-efs-csi-driver"
      create: false
  storageClasses:
    - name: efs-sc
      parameters:
        provisioningMode: efs-ap
        fileSystemId: ${aws_efs_file_system.eks_pv.id}
        directoryPerms: "700"
  VALUES
  ]
}
