variable "cluster_name" {
  type    = string
  default = "my-cluster"
}

variable "cluster_version" {
  type    = string
  default = "1.23"
}

variable "instance_types" {
  type    = list(string)
  default = ["t3a.large"]
}

variable "worker_nodes_min_size" {
  type    = number
  default = 1
}

variable "disk_size" {
  type    = number
  default = 50
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
