resource "google_compute_instance" "dagster_test" {
  boot_disk {
    auto_delete = true
    device_name = "dagster-test"

    initialize_params {
      image = "https://www.googleapis.com/compute/beta/projects/debian-cloud/global/images/debian-11-bullseye-v20220822"
      size  = 10
      type  = "pd-balanced"
    }

    mode   = "READ_WRITE"
    source = "https://www.googleapis.com/compute/v1/projects/myhybrid-200215/zones/us-central1-a/disks/dagster-test"
  }

  confidential_instance_config {
    enable_confidential_compute = false
  }

  machine_type = "e2-medium"

  metadata = {
    ssh-keys = "lopp_sean:ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBM/jnCkn3QYVasChQKuZjbwI2jT5WgpxcDe+KT57k94XxaybF6KdIA+I84njmPWbnwBgLfhJlmf1fXgNegdJqqg= google-ssh {\"userName\":\"lopp.sean@gmail.com\",\"expireOn\":\"2022-09-14T20:04:11+0000\"}\nlopp_sean:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAGzM0zNIAytpNK9FanzAh86fxyC6lTDqE+UGGb6VLtbQKq9NGfPza1fNprrZJDUVhJXx+t3Lgyz4bpyxdBFkeD8D+yNZIYZepyYnM0/d7tXg+kKZ6HjNmMs08XvFlhSIkpeq5HyUyn4FOrC3tKDvuVTOB8nhjpmkwtYJ/5mLM4WFa2BHqZrMVT8xdSXfIJjnjtRKeVgCfSC6m3Ff3Q0nhsnQN57xrlGFdSp5BSfl1dJ0dRDnkQzA7pswTOto3t1Rx7xCrEcj6xFAa6pSWFDV8Q0ZY2YxbqBIemI7J/lI2H2g6xXrHaXhDQ5vNxKW9XoOOlfAAFJLKHQbI8M7n7UwaDc= google-ssh {\"userName\":\"lopp.sean@gmail.com\",\"expireOn\":\"2022-09-14T20:04:26+0000\"}"
  }

  name = "dagster-test"

  network_interface {
    access_config {
      nat_ip       = "35.222.30.166"
      network_tier = "PREMIUM"
    }

    network            = "https://www.googleapis.com/compute/v1/projects/myhybrid-200215/global/networks/default"
    network_ip         = "10.128.0.2"
    stack_type         = "IPV4_ONLY"
    subnetwork         = "https://www.googleapis.com/compute/v1/projects/myhybrid-200215/regions/us-central1/subnetworks/default"
    subnetwork_project = "myhybrid-200215"
  }

  project = "myhybrid-200215"

  reservation_affinity {
    type = "ANY_RESERVATION"
  }

  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
    provisioning_model  = "STANDARD"
  }

  service_account {
    email  = "811245043115-compute@developer.gserviceaccount.com"
    scopes = ["https://www.googleapis.com/auth/devstorage.read_only", "https://www.googleapis.com/auth/logging.write", "https://www.googleapis.com/auth/monitoring.write", "https://www.googleapis.com/auth/service.management.readonly", "https://www.googleapis.com/auth/servicecontrol", "https://www.googleapis.com/auth/trace.append"]
  }

  shielded_instance_config {
    enable_integrity_monitoring = true
    enable_vtpm                 = true
  }

  zone = "us-central1-a"
}
# terraform import google_compute_instance.dagster_test projects/myhybrid-200215/zones/us-central1-a/instances/dagster-test
