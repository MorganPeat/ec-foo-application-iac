module "storage" {
  source = "../../modules/storage"

  bucket_name  = "foo-bucket"
  project_id   = var.project_id
  gcs_location = var.region
}