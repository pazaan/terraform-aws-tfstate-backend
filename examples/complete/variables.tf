variable "region" {
  type        = string
  description = "AWS region"
}

variable "arn_format" {
  type        = string
  default     = "arn:aws"
  description = "ARN format to be used. May be changed to support deployment in GovCloud/China regions."
}

variable "acl" {
  type        = string
  description = "The canned ACL to apply to the S3 bucket"
  default     = "private"
}

variable "billing_mode" {
  default     = "PROVISIONED"
  description = "DynamoDB billing mode"
}

variable "read_capacity" {
  default     = 5
  description = "DynamoDB read capacity units"
}

variable "write_capacity" {
  default     = 5
  description = "DynamoDB write capacity units"
}

variable "force_destroy" {
  type        = bool
  description = "A boolean that indicates the S3 bucket can be destroyed even if it contains objects. These objects are not recoverable"
  default     = false
}

variable "mfa_delete" {
  type        = bool
  description = "A boolean that indicates that versions of S3 objects can only be deleted with MFA. ( Terraform cannot apply changes of this value; https://github.com/terraform-providers/terraform-provider-aws/issues/629 )"
  default     = false
}

variable "enable_point_in_time_recovery" {
  type        = bool
  description = "Enable DynamoDB point-in-time recovery"
  default     = true
}

variable "enable_server_side_encryption" {
  type        = bool
  description = "Enable DynamoDB server-side encryption"
  default     = true
}

variable "enable_public_access_block" {
  type        = bool
  description = "Enable Bucket Public Access Block"
  default     = true
}

variable "block_public_acls" {
  type        = bool
  description = "Whether Amazon S3 should block public ACLs for this bucket"
  default     = true
}

variable "ignore_public_acls" {
  type        = bool
  description = "Whether Amazon S3 should ignore public ACLs for this bucket"
  default     = true
}

variable "block_public_policy" {
  description = "Whether Amazon S3 should block public bucket policies for this bucket"
  default     = true
}

variable "restrict_public_buckets" {
  type        = bool
  description = "Whether Amazon S3 should restrict public bucket policies for this bucket"
  default     = true
}

variable "prevent_unencrypted_uploads" {
  type        = bool
  default     = true
  description = "Prevent uploads of unencrypted objects to S3"
}

variable "profile" {
  type        = string
  default     = ""
  description = "AWS profile name as set in the shared credentials file"
}

variable "role_arn" {
  type        = string
  default     = ""
  description = "The role to be assumed"
}

variable "terraform_backend_config_file_name" {
  type        = string
  default     = "terraform.tf"
  description = "Name of terraform backend config file"
}

variable "terraform_backend_config_file_path" {
  type        = string
  default     = ""
  description = "Directory for the terraform backend config file, usually `.`. The default is to create no file."
}

variable "terraform_backend_config_template_file" {
  type        = string
  default     = ""
  description = "The path to the template used to generate the config file"
}

variable "terraform_version" {
  type        = string
  default     = "0.12.2"
  description = "The minimum required terraform version"
}

variable "terraform_state_file" {
  type        = string
  default     = "terraform.tfstate"
  description = "The path to the state file inside the bucket"
}

variable "s3_bucket_name" {
  type        = string
  default     = ""
  description = "S3 bucket name. If not provided, the name will be generated by the label module in the format namespace-stage-name"
}

variable "s3_replication_enabled" {
  type        = bool
  default     = false
  description = "Set this to true and specify `s3_replica_bucket_arn` to enable replication"
}

variable "s3_replica_bucket_arn" {
  type        = string
  default     = ""
  description = "The ARN of the S3 replica bucket (destination)"
}

variable "logging" {
  type = object({
    bucket_name = string
    prefix      = string
  })
  default     = null
  description = "Bucket access logging configuration."
}

variable "bucket_enabled" {
  type        = bool
  default     = true
  description = "Whether to create the s3 bucket."
}

variable "dynamodb_enabled" {
  type        = bool
  default     = true
  description = "Whether to create the dynamodb table."
}
