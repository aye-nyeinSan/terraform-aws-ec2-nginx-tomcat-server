
resource "aws_internet_gateway" "first-internet-gateway" {
  vpc_id = aws_vpc.main.id

}

resource "aws_route_table" "publicRouteTable" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.first-internet-gateway.id
  }


  tags = {
    Name = "public-rt"
  }
}

resource "aws_route_table_association" "publicRoute" {
  subnet_id      = aws_subnet.public_Subnet.id
  route_table_id = aws_route_table.publicRouteTable.id


}