variable "cluster_name" {
  type    = string
  default = "My Cluster"
}

variable "cluster_version" {
  type    = string
  default = "1.23"
}

variable "instance_types" {
  type    = list(string)
  default = ["t3a.large"]
}

variable "volume_size" {
  type    = number
  default = 50
}

variable "volume_type" {
  type    = string
  default = "gp3"
}

variable "device_name" {
  type    = string
  default = "/dev/xvda"
}

variable "worker_nodes_min_size" {
  type    = number
  default = 1
}

variable "worker_nodes_max_size" {
  type    = number
  default = 10
}

variable "worker_nodes_desired_size" {
  type    = number
  default = 3
}

variable "capacity_type" {
  type    = string
  default = "ON_DEMAND"
}

variable "region" {
  type    = string
  default = "ap-south-1"
}

variable "efs_service_account" {
  type    = string
  default = "aws-efs-csi-driver"
}

variable "efs_namespace" {
  type    = string
  default = "aws-efs-csi-driver"
}
