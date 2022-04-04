 resource "aws_vpc" "my_vpc" {
  cidr_block = "${var.vpc-cidr}"

  tags = {
    Name = "my_vpc"
  }
}

resource "aws_subnet" "public_subnet" {
  count = 2
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "${element(public_cidr, count.index)}"
  availability_zone = "${element(public_subnet, count.index)}"
  tags = {
    Name = "public_subnet ${(count.index+1)}"
  }
}

/* resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "192.168.2.0/24"
  availability_zone = "us-west-1b"
  tags = {
    Name = "private"
  }
} */

resource "aws_internet_gateway" "IGW" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Name = "IGW"
  }
}


resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.my_vpc.id


  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.IGW.id
  }


  tags = {
    name = "public"
  }
}
resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public_rt.id
}

output "vpc_id" {
  value = aws_vpc.my_vpc.id
}

output "vpc_owner_id" {
  value = aws_vpc.my_vpc.owner_id
}
