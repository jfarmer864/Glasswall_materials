provider "aws" {
  region  = "eu-west-1"
}

# create a vpc
resource "aws_vpc" "app" {
  cidr_block = "${var.cidr_block}"

  tags = {
    Name = "${var.name}"
  }
}

# internet gateway
resource "aws_internet_gateway" "app" {
  vpc_id = "${aws_vpc.app.id}"

  tags = {
    Name = "${var.name}"
  }
}

# APP
# create a subnet
module "app" {
   source = "./app_tier"
   vpc_id = "${aws_vpc.app.id}"
   name = "${var.name}"
   gateway_id = "${aws_internet_gateway.app.id}"
   db-private-ip = "${module.db.db-private-ip}"
   app-ami-id = "${var.app_ami_id}"
}

# DB
# create a subnet
module "db" {
   source = "./db_tier"
   vpc_id = "${aws_vpc.app.id}"
   name = "${var.name}"
   app-security-group-id = "${module.app.app-security-group-id}"
   app-subnet-cidr-block = "${module.app.app-subnet-cidr-block}"
   db-ami-id = "${var.db_ami_id}"
}
