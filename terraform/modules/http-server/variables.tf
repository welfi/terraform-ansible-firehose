variable "app_name" {
  type = string
}

variable "vpc_security_group_ids" {
  type = list(string)
}


variable "stage" {
  type = string
}

variable "ssh_key_name" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "security_group" {
  type = string
}

variable "server_private_ipv4" {
  type    = string
  default = "10.0.0.10" # some ip's are reserved
}

variable "instance_type" {
  type = string
}

variable "elastic_ip_allocation_id" {
  type = string
}

variable "subnet_count" {
  description = "Number of subnets"
  type        = map(number)
  default = {
    public  = 1,
    private = 2
  }
}
