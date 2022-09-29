variable "app_name" {
  description = "The name of the App that will be launch"
}

variable "stage" {
  description = "Environment to launch"
}

variable "database_port" {
  type        = number
  description = "database port to use"
  default     = 5432
}

variable "subnet_count" {
  description = "Number of subnets"
  type        = map(number)
  default = {
    public  = 1,
    private = 2
  }
}

variable "private_subnet_cidr_blocks" {
  description = "Available CIDR blocks for private subnets"
  type        = list(string)
  default = [
    "10.0.101.0/24",
    "10.0.102.0/24",
    "10.0.103.0/24",
    "10.0.104.0/24",
  ]
}
