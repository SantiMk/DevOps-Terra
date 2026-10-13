variable "tf_state_bucket" {
  description = "name of S3 bucket in AWS for storing TF state"
  default     = "devops-recipie"
}

variable "tf_state_lock_table" {
  description = "name of DynamoDB table in AWS for storing TF state locks"
  default     = "devops-recepie-api-erraform-lock"
}

variable "project" {
  description = "Project name of the tagging resources"
  default     = "devops-recipie-api"
}

variable "contact" {
  description = "Contact email of the tagging resources"
  default     = "santi.makaruk@gmail.com"
}