resource "kubernetes_secret" "terraform-secrets" {
  metadata {
    name = "terraform-secrets"
  }

  data {
    "DB_USERNAME" = "${var.db_username}"
    "DB_PASSWORD" = "${random_string.root_password.result}"
    "DB_ADDRESS"  = "${aws_db_instance.postgres.address}:${aws_db_instance.postgres.port}"
  }
}
