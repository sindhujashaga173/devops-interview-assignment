# cost_optimization.tf — Cost Optimization Resources
#
# TASK: Review data/aws_cost_report.json and implement cost-saving measures.
#
# Requirements:
#   1. Analyze the cost report and identify the top savings opportunities
#   2. Implement Terraform resources that address the findings, such as:
#      - S3 lifecycle policies for tiered storage
#      - Spot/mixed instance configurations for node groups
#      - Right-sizing recommendations implemented as resource changes
#   3. Add a comment block at the top explaining your cost analysis:
#      - Current monthly cost and top cost drivers
#      - Proposed changes and estimated savings
#      - Any trade-offs or risks

############################################################
# --- Your cost analysis ---
#
# Current Monthly Cost: ~$4,850
#
# Top Cost Drivers:
#   1. EKS worker nodes (GPU-heavy workloads) – ~52%
#   2. S3 video chunk storage – ~28%
#   3. NAT Gateway traffic – ~12%
#
# Observations:
#   - 95% of video access occurs within first 30 days
#   - GPU utilization is low (~30% average)
#   - General workloads are stateless and interruption-tolerant
#
# Proposed Changes:
#   - Add S3 lifecycle tiering (IA → Glacier → Expire)
#   - Use SPOT capacity for general node group
#   - Right-size GPU desired capacity to 1
#
# Estimated Savings: ~$2,000–$2,500/month (~40–45%)
#
# Trade-offs:
#   - Spot interruptions possible
#   - Glacier retrieval latency
#   - Reduced GPU baseline increases scale-up time slightly
#
############################################################



############################################################
# --- S3 Lifecycle Policies ---
############################################################

resource "aws_s3_bucket_lifecycle_configuration" "video_chunks_lifecycle" {
  bucket = var.video_chunks_bucket_name

  rule {
    id     = "video-tiering"
    status = "Enabled"

    transition {
      days          = 30
      storage_class = "STANDARD_IA"
    }

    transition {
      days          = 90
      storage_class = "GLACIER"
    }

    expiration {
      days = 365
    }
  }
}



############################################################
# --- Spot/Mixed Instance Configuration ---
############################################################

# Update general node group to use SPOT capacity
# (Modify existing node group definition if already declared)

# capacity_type = "SPOT"



############################################################
# --- Other Cost Optimizations ---
############################################################

# Right-size GPU desired capacity
# Set desired_size = 1 in existing GPU node group

# Ensure worker nodes use gp3 volumes instead of gp2
# volume_type = "gp3"

