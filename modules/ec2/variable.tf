variable "instance_ami" {
 type = string 
}

variable "instance_type" {
 type = string 
}

variable "tags" {
  type = map(string)
}

variable "subnet_id" {
  type = string 
}