# data "aws_ami" "amazon_linux_2" {
#   most_recent      = true
#   owners           = ["amazon"]

#   filter {
#     name   = "name"                              # Filter for AMI names that match the specified pattern
#     values = ["amzn2-ami-hvm-*-x86_64-gp2"]      # Pattern to match Amazon Linux 2 AMIs with HVM virtualization, x86_64 architecture, and gp2 storage
#   }

#   filter {
#     name   = "root-device-type"     # Filter for AMIs that use EBS as the root device
#     values = ["ebs"]                # Elastic Block Store (EBS) root device type
#   }

#   filter {
#     name   = "virtualization-type"  # Filter for AMIs that use HVM virtualization
#     values = ["hvm"]                # Hardware Virtual Machine (HVM) virtualization type
#   }
  
# }

# data "aws_availability_zones" "available" {
#   state = "available"
# }