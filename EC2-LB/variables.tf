# variables.tf
 
# Variables for general information
######################################
 
variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}
 
variable "owner" {
  description = "Configuration owner"
  type        = string
  default     = "py"
}
 
variable "aws_region_az_01" {
  description = "AWS region availability zone"
  type        = string
  default     = "a"
}
variable "aws_region_az_02" {
  description = "AWS region availability zone"
  type        = string
  default     = "b"
}
 
# Variables for VPC
######################################
 
variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}
 
variable "vpc_dns_support" {
  description = "Enable DNS support in the VPC"
  type        = bool
  default     = true
}
 
variable "vpc_dns_hostnames" {
  description = "Enable DNS hostnames in the VPC"
  type        = bool
  default     = true
}
 
 
# Variables for Security Group
######################################
 
variable "sg_ingress_proto" {
  description = "Protocol used for the ingress rule"
  type        = string
  default     = "tcp"
}
 
variable "sg_ingress_ssh" {
  description = "Port used for the ingress rule"
  type        = string
  default     = "22"
}

variable "ssh_user" {
  description = "username used for the ssh  rule"
  type        = string
  default     = "ubuntu"
}
variable "ssh_port" {
  description = "port used for the ssh  rule"
  type        = number
  default     = "22"
}


variable "sg_ingress_80" {
  description = "Port used for the ingress rule"
  type        = string
  default     = "80"
}
variable "sg_ingress_443" {
  description = "Port used for the ingress rule"
  type        = string
  default     = "443"
}
variable "sg_ingress_3478" {
  description = "Port used for the ingress rule"
  type        = string
  default     = "3478"
}
variable "sg_ingress_5349" {
  description = "Port used for the ingress rule"
  type        = string
  default     = "5349"
}
 
variable "sg_egress_proto" {
  description = "Protocol used for the egress rule"
  type        = string
  default     = "-1"
}
 
variable "sg_egress_all" {
  description = "Port used for the egress rule"
  type        = string
  default     = "0"
}
 
variable "sg_egress_cidr_block" {
  description = "CIDR block for the egress rule"
  type        = string
  default     = "0.0.0.0/0"
}
 
 
# Variables for Subnet
######################################
 
variable "sbn_public_ip" {
  description = "Assign public IP to the instance launched into the subnet"
  type        = bool
  default     = true
}
 
variable "sbn_cidr_block" {
  description = "CIDR block for the subnet"
  type        = string
  default     = "10.0.1.0/24"
}
 
 
# Variables for Route Table
######################################
 
variable "rt_cidr_block" {
  description = "CIDR block for the route table"
  type        = string
  default     = "0.0.0.0/0"
}
 
 
# Variables for Instance
######################################
 
variable "instance_ami" {
  description = "ID of the AMI used"
  type        = string
  default     = "ami-0747bdcabd34c712a"
}
 
variable "instance_type" {
  description = "Type of the instance"
  type        = string
  default     = "t3.medium"
}
 ############ IF WANT TO USE EXISTING KEYPAIR##########
# variable "key_pair" {
#   description = "SSH Key pair used to connect"
#   type        = string
#   default     = "joc-key-pair"
# }
 
variable "root_device_type" {
  description = "Type of the root block device"
  type        = string
  default     = "gp2"
}
 
variable "root_device_size" {
  description = "Size of the root block device"
  type        = string
  default     = "10"
}

# variable "PRIVATE_KEY_PATH" {
#   description = "pem key for logging"
#   default     = "jitsi.pem"
# }

##################VARIABLE FOR CREATING KEY_PAIR########

variable "PUBLIC_KEY_PATH" {
    default = "jitsi.pub"
}


variable "PRIVATE_KEY_PATH" {
    default = "jitsi"
}

########################## S3 BUCKET  VARIABLE##################

variable "bucket_name" {
  description = "This is default bucket used for terraform"
  type        = string
  default     = "terraform2020202111" 
  
}
########################


##############INSTANCES instance_count

variable "instance_count" {
 default = "1"
}