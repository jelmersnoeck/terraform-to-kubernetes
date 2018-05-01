output "db_username" {
  value = "${var.db_username}"
}

output "db_password" {
  value = "${random_string.root_password.result}"
}

output "db_address" {
  value = "${aws_db_instance.postgres.address}:${aws_db_instance.postgres.port}"
}
