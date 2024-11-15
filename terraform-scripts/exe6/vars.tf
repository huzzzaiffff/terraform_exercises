variable "REGION" { default = "us-east-1" } # Default AWS region.
variable "ZONE1" { default = "us-east-1a" } # Availability zone 1.
variable "ZONE2" { default = "us-east-1b" } # Availability zone 2.
variable "ZONE3" { default = "us-east-1c" } # Availability zone 3.

variable "AMIS" {
  type    = map(any)
  default = { us-east-1 = "ami-012967cc5a8c9f891" } # AMI IDs for each region.
}

variable "USER" { default = "ec2-user" }         # Default username for SSH access.
variable "PUB_KEY" { default = "ip.pub" }        # Path to the public key file.
variable "PRIV_KEY" { default = "ip" }           # Path to the private key file.
variable "MYIP" { default = "116.66.189.23/32" } # User's IP address for SSH access restriction.

