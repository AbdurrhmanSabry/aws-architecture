module "network" {
    source = "./network"
    region = var.region
    vpc_cidr = var.vpc_cidr
    public_subnet_one_cidr = var.public_subnet_one_cidr
    public_subnet_two_cidr = var.public_subnet_two_cidr
    private_subnet_one_cidr = var.private_subnet_one_cidr
    private_subnet_two_cidr = var.private_subnet_two_cidr
    name_environment = var.name_environment
}