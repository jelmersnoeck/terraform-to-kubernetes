resource "vault_mount" "postgres" {
  path = "postgres"
  type = "database"
}

resource "vault_database_secret_backend_connection" "postgres" {
  backend       = "${vault_mount.postgres.path}"
  name          = "postgres"
  allowed_roles = ["prod"]

  postgresql {
    connection_url = "postgres://${var.db_username}:${random_string.root_password.result}@${aws_db_instance.postgres.address}:${aws_db_instance.postgres.port}"
  }

  verify_connection = false
}

resource "vault_generic_secret" "postgres" {
  path = "secret/terraform-kubernetes"

  data_json = <<EOT
  {
    "DB_USERNAME": "${var.db_username}",
    "DB_PASSWORD": "${random_string.root_password.result}",
    "DB_ADDRESS": "${aws_db_instance.postgres.address}:${aws_db_instance.postgres.port}"
  }
EOT
}
