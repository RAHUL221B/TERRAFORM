resource "aws_vpc" "primary_vpc" {
  cidr_block = "192.168.0.0/16"
  tags = {
      Name = "primary"
  }
}


resource "aws_subnet" "subnets" {
  count = length(var.subnet_cidrs)

  vpc_id = aws_vpc.primary_vpc.id
  availability_zone = var.subnet_azs[count.index]
  cidr_block = var.subnet_cidrs[count.index]

  tags = {
      Name = var.subnet_names[count.index]
  }
}