resource "tls_private_key" "key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
resource "aws_key_pair" "deployer" {
  key_name   = "Mykey"
  public_key = tls_private_key.key.public_key_openssh

}
resource "local_sensitive_file" "privateKey" {
  filename = "myKey.pem"
  content  = tls_private_key.key.private_key_pem

}

resource "aws_instance" "public_web_server" {
  ami                         = "ami-008fe2fc65df48dac" # ubuntu free-tier
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.deployer.key_name
  subnet_id                   = aws_subnet.public_Subnet.id
  associate_public_ip_address = true

  vpc_security_group_ids = [aws_security_group.my_sg.id]
   user_data = file("${path.root}/script/nginx_install.tpl")


  tags = {
    Name = "public_web_server"
  }
  provisioner "local-exec" {
    command = "echo 'Instance created!' > instance_created.txt"
  }
}
