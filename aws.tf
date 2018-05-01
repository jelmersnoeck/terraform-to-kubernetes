variable "db_username" {
  default = "terraform"
}

resource "random_string" "root_password" {
  length  = 32
  special = true
}

resource "aws_db_instance" "postgres" {
  engine         = "postgres"
  engine_version = "10.3"
  instance_class = "db.t2.micro"

  storage_type      = "gp2"
  allocated_storage = "10"

  name     = "terraformkubernetes"
  username = "${var.db_username}"
  password = "${random_string.root_password.result}"
}
