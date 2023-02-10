Learn Terraform: https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli

Problem:
│ Error: Error response from daemon: This node is not a swarm manager. Use "docker swarm init" or "docker swarm join" to connect this node to swarm and try again.
│ 
│   with docker_service.nginx_service,
│   on main.tf line 38, in resource "docker_service" "nginx_service":
│   38: resource "docker_service" "nginx_service" {
│ 
╵

Solution:
docker swarm init


Terraform Commands
------------------
terraform destroy -auto-approve
terraform apply -auto-approve

Notes:
docket_local_1.tf and docket_local_1.tf creates 2 seperate nginx instances running on different ports