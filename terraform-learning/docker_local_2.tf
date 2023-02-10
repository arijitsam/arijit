# Create a docker image resource
# -> docker pull nginx:latest
resource "docker_image" "nginx2" {
  name         = "nginx:latest"
  keep_locally = true
}

# Create a docker container resource
# -> same as 'docker run --name nginx -p8080:80 -d nginx:latest'
resource "docker_container" "nginx2" {
  name  = "nginx2"
  image = docker_image.nginx2.image_id

  ports {
    external = 8090
    internal = 80
  }
}

# Or create a service resource
# -> same as 'docker service create -d -p 8081:80 --name nginx-service2 --replicas 2 nginx:latest'
resource "docker_service" "nginx_service2" {
  name = "nginx-service2"
  task_spec {
    container_spec {
      image = docker_image.nginx2.repo_digest
    }
  }

  mode {
    replicated {
      replicas = 2
    }
  }

  endpoint_spec {
    ports {
      published_port = 8091
      target_port    = 80
    }
  }
}