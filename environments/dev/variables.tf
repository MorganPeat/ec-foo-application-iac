variable "project_id" {
  description = "GCP Project ID."
  type        = string
}

variable "region" {
  type        = string
  description = "Region in which to deploy"

  default = "europe-west1" # Belgium, slightly cheaper than London
}
