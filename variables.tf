variable "name" {
  default="app-jack"
}

variable "app_ami_id" {
  default="<ami-id-app>"
}

variable "db_ami_id" {
  default="<ami-id-db>"
}

variable "cidr_block" {
  default="10.0.0.0/16"
}
