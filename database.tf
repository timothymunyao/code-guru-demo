data "aws_availability_zones" "available" {}

variable "db_username" {}
variable "db_password" {}
variable "db_name" {}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name                 = "codeguru-test"
  cidr                 = "10.0.0.0/16"
  azs                  = data.aws_availability_zones.available.names
  public_subnets       = ["10.0.4.0/24", "10.0.5.0/24"]
  enable_dns_hostnames = true
  enable_dns_support   = true
}

# # 3. Create Custom Route Table
resource "aws_db_subnet_group" "db_subnet_group" {
  subnet_ids = module.vpc.public_subnets
  tags       = {
    Project = "Code Guru Test"
  }
}

# # 6. Create Security Group to allow port 1433
resource "aws_security_group" "allow_mysql" {
  name        = "allow_mysql"
  description = "Allow MySQL traffic (3306)"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description = "MySQL"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "MySQL"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Project = "Code Guru Test"
  }
}

resource "aws_db_instance" "codeguru_test_instance" {
  identifier              = "codegurutestdatabaseinstance"
  instance_class          = "db.t2.micro"
  storage_type            = "gp3"
  allocated_storage       = 20
  engine                  = "mysql"
  engine_version          = "8.0"
  username                = var.db_username
  password                = var.db_password
  db_name                 = var.db_name
  db_subnet_group_name    = aws_db_subnet_group.db_subnet_group.name
  vpc_security_group_ids  = [aws_security_group.allow_mysql.id]
  backup_retention_period = 1
  publicly_accessible     = true
  skip_final_snapshot     = true
}