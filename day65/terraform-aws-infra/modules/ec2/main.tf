resource "aws_instance" "TerraWeek-Server" {
    # ami           = "ami-01b14b7ad41e17ba4" # Amazon Linux 2 AMI (HVM), SSD Volume Type - ami-01b14b7ad41e17ba4
    # ami           = "ami-0ec10929233384c7f"   # Ubuntu Server 22.04 LTS (HVM), SSD Volume Type - ami-0ec10929233384c7f
    ami          = data.aws_ami.amazon_linux_2.id # Using the data source to get the latest Amazon Linux 2 AMI
    # instance_type = var.instance_type         # t3.micro for dev, t3.small for prod
    instance_type = var.environment == "prod" ? "t3.small" : "t3.micro"
    associate_public_ip_address = true
    vpc_security_group_ids =  [aws_security_group.TerraWeek-SG.id]
    subnet_id = aws_subnet.TerraWeek-Public-Subnet.id
    tags = {
        Name = "${local.name_prefix}-server"
    }
    lifecycle {
  create_before_destroy = true  # Ensures that a new resource is created before the old one is destroyed during updates
  # prevent_destroy = true        # Prevents the resource from being destroyed without manual intervention
  # ignore_changes = [tags]       # Ignores changes to the 'tags' attribute, allowing updates to tags without triggering resource replacement
}
}