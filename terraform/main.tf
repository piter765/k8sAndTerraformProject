data "google_container_engine_versions" "default" {
  location = "us-central1-c"
}

data "google_client_config" "current" {

}

resource "google_container_cluster" "default" {
  name               = "my-first-cluster"
  location           = "us-central1-c"
  initial_node_count = 3
  min_master_version = data.google_container_engine_versions.default
  node_config {
    machine_type = "g1-small"
    disk_size_gb = 32
  }
  provisioner "local-exec" { # it is used to execute sleep 90 when the cluster is destroyed
    when    = destroy
    command = "sleep 90"
  }
}
