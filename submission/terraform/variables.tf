variable "aws_region" {
  description = "AWS region for deployment"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Environment name (dev, staging, production)"
  type        = string
}

variable "site_id" {
  description = "Customer site identifier"
  type        = string
}

variable "cluster_name" {
  description = "EKS cluster name"
  type        = string
  default     = "video-analytics"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "general_instance_types" {
  description = "Instance types for general workload node group"
  type        = list(string)
  default     = ["t3.large"]
}

variable "gpu_instance_types" {
  description = "Instance types for GPU workload node group"
  type        = list(string)
  default     = ["g4dn.xlarge"]
}

variable "general_desired_size" {
  type        = number
  default     = 2
}

variable "general_min_size" {
  type        = number
  default     = 1
}

variable "general_max_size" {
  type        = number
  default     = 4
}

variable "gpu_desired_size" {
  type        = number
  default     = 1
}

variable "gpu_min_size" {
  type        = number
  default     = 0
}

variable "gpu_max_size" {
  type        = number
  default     = 2
}

# --- S3 Buckets ---

variable "analytics_bucket_name" {
  description = "S3 bucket for processed analytics"
  type        = string
}

variable "video_chunks_bucket_name" {
  description = "S3 bucket for raw uploaded video chunks"
  type        = string
}

# --- Security ---

variable "management_cidr" {
  description = "CIDR block allowed to SSH into bastion"
  type        = string
}

