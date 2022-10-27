output "cluster_name" {
  value = var.cluster_name
}

output "region" {
  value = var.region
}

output "subnets" {
  value = [
    data.aws_subnets.default.ids.0,
    data.aws_subnets.default.ids.1,
    data.aws_subnets.default.ids.2
  ]
}
