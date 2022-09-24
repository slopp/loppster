resource "google_artifact_registry_repository" "dagit" {
  description   = "DAGS"
  format        = "DOCKER"
  location      = "us-central1"
  project       = "myhybrid-200215"
  repository_id = "dagit"
}
# terraform import google_artifact_registry_repository.dagit projects/myhybrid-200215/locations/us-central1/repositories/dagit
