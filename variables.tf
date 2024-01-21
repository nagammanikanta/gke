variable "project_id" {
  type        = string
  description = "The project ID to host the cluster in"
  default     = "coral-current-408814"
}

variable "region" {
  type        = string
  description = "The region to host the cluster in"
  default     = "us-central1"
}