variable "instances" {
  type = map(object({
    ami           = string
    user          = string
    os_family     = string
    instance_type = string
    instance_id   = optional(string)
    instance_state = optional(string)
  }))
default = {
  "web-server" = {
    ami = "ami-0ec10929233384c7f"
    user = "ubuntu"
    os_family = "Ubuntu"
    instance_type = "t3.micro"
    # instance_id = "i-0351acd52ee7186c0"
  }
  "app-server" = {
    ami = "ami-0ec10929233384c7f"
    user = "ubuntu"
    os_family = "Ubuntu"
    instance_type = "t3.micro"
    # instance_id = "i-018c862cdc60b3b91"
  }
  "db-server" = {
    ami = "ami-0ec10929233384c7f"
    user = "ubuntu"
    os_family = "Ubuntu"
    instance_type = "t3.micro"
    # instance_id = "i-018c862cdc60b3b91"
  }
}
}