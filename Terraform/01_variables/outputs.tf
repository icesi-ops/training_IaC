
output "container_id" {
  value = "${docker_container.frontend.hostname}"
}
output "container_port" {
  value = "${docker_container.frontend.ports}"
}
