output "cluster_name" {
  value = var.cluster_name
}

output "region" {
  value = var.region
}

output "vpc_id" {
  value = data.aws_vpc.default.id
}

output "subnets" {
  value = [
    data.aws_subnets.default.ids.0,
    data.aws_subnets.default.ids.1,
    data.aws_subnets.default.ids.2
  ]
}

output "node_security_group_id" {
  value = module.eks.node_security_group_id
}

output "oidc_provider_arn" {
  value = module.eks.oidc_provider_arn
}

output "cluster_oidc_issuer_url" {
  value = module.eks.cluster_oidc_issuer_url
}
