####################################################
# Local module showing how the foo application chooses
# to configure cloud resources
#
# All environments will look mostly the same, but with 
# slight variations, controlled by variables
####################################################


locals {
  labels = {
    app  = "foo"
    type = "backup-data"
  }
}

# Simplest usage - call the module with mandatory variables only
# Accept all defaults - they should be valid
module "storage-simple" {
  source  = "app.terraform.io/morgan-peat-ec/ec-storage-module/google"
  version = "0.1.1"

  project_id  = var.project_id
  bucket_name = "${var.bucket_name}-simple"
  labels      = local.labels
}

# Intermediate usage - customise resource usage by supplying 
# overrides to the default variables
module "storage-intermediate" {
  source  = "app.terraform.io/morgan-peat-ec/ec-storage-module/google"
  version = "0.1.1"

  project_id  = var.project_id
  bucket_name = "${var.bucket_name}-intermediate"
  labels      = local.labels

  gcs_location  = var.gcs_location
  storage_class = "STANDARD"
}


# Advanced usage - call the tf resources directly
# Can customise exactly how we want; the guardrails will keep us save
# However - take on the burden of maintenance - can't just bump a module version
resource "google_storage_bucket" "bucket" {
  name          = "${var.bucket_name}-advanced"
  project       = var.project_id
  location      = var.gcs_location
  storage_class = "STANDARD"
  labels        = local.labels
}