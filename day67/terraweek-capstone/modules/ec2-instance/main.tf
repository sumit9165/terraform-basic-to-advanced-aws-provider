resource "aws_instance" "day67" {
  ami = var.ami_id
  instance_type = "${var.instance_type}"
  tags = {
    Name = "${var.project_name}-${var.environment}-instance"
  }
}