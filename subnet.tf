resource "aws_subnet" "public_subnet" {
  count = 2
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "${element(var.public_cidr, count.index)}"
  availability_zone = "${element(var.public_subnet, count.index)}"
  tags = {
    Name = "public_subnet ${(count.index+1)}"
  }
}

resource "aws_internet_gateway" "IGW" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Name = "IGW-444"
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
  count = 2
  subnet_id      = "${element(aws_subnet.public_subnet.*.id, count.index)}" 
  route_table_id = aws_route_table.public_rt.id
}

output "vpc_id" {
  value = aws_vpc.my_vpc.id
}

output "vpc_owner_id" {
  value = aws_vpc.my_vpc.owner_id
}
