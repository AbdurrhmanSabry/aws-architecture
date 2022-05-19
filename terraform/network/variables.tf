variable "vpc_cidr" {
    type = string
    description = "define the cidr of your vpc"
}
variable "name_environment" {
    type = string
    description = "write environment name"
}
variable "region" {
    type = string
    description = "define where to launch the resources"
}
variable "public_subnet_one_cidr" {
    type = string
    description = "define the cidr of your public subnet one"
}
variable "public_subnet_two_cidr" {
    type = string
    description = "define the cidr of your public subnet two"
}
variable "private_subnet_one_cidr" {
    type = string
    description = "define the cidr of your private subnet one"
}
variable "private_subnet_two_cidr" {
    type = string
    description = "define the cidr of your private subnet two"
}