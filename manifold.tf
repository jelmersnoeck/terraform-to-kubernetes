resource "manifold_credential" "db_username" {
  project  = "devopsdays-kiev"
  resource = "terraform-kubernetes"
  key      = "DB_USERNAME"
  value    = "${var.db_username}"
}

resource "manifold_credential" "db_password" {
  project  = "devopsdays-kiev"
  resource = "terraform-kubernetes"
  key      = "DB_PASSWORD"
  value    = "${random_string.root_password.result}"
}

resource "manifold_credential" "db_address" {
  project  = "devopsdays-kiev"
  resource = "terraform-kubernetes"
  key      = "DB_ADDRESS"
  value    = "${aws_db_instance.postgres.address}:${aws_db_instance.postgres.port}"
}
