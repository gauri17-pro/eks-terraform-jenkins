resource "aws_instance" "myjenkins-server" {
  ami                         = data.aws_ami.latest-amazon-linux-image.id
  instance_type               = var.instance_type
  key_name                    = "jenkins-server-key"
  subnet_id                   = aws_subnet.myjenkins-server-subnet-1.id
  vpc_security_group_ids      = [aws_default_security_group.default-sg.id]
  availability_zone           = var.availability_zone
  associate_public_ip_address = true
  user_data                   = file("jenkins-server-setup.sh")
  tags = {
    Name = "${var.env_prefix}-server"
  }
}