output "s3_bucket_inventories_id" {
  description = "Map of id values across all s3_bucket_inventories, keyed the same as var.s3_bucket_inventories"
  value       = { for k, v in aws_s3_bucket_inventory.s3_bucket_inventories : k => v.id if v.id != null && length(v.id) > 0 }
}
output "s3_bucket_inventories_bucket" {
  description = "Map of bucket values across all s3_bucket_inventories, keyed the same as var.s3_bucket_inventories"
  value       = { for k, v in aws_s3_bucket_inventory.s3_bucket_inventories : k => v.bucket if v.bucket != null && length(v.bucket) > 0 }
}
output "s3_bucket_inventories_destination" {
  description = "Map of destination values across all s3_bucket_inventories, keyed the same as var.s3_bucket_inventories"
  value       = { for k, v in aws_s3_bucket_inventory.s3_bucket_inventories : k => one(v.destination) if v.destination != null && length(v.destination) > 0 }
}
output "s3_bucket_inventories_enabled" {
  description = "Map of enabled values across all s3_bucket_inventories, keyed the same as var.s3_bucket_inventories"
  value       = { for k, v in aws_s3_bucket_inventory.s3_bucket_inventories : k => v.enabled if v.enabled != null }
}
output "s3_bucket_inventories_filter" {
  description = "Map of filter values across all s3_bucket_inventories, keyed the same as var.s3_bucket_inventories"
  value       = { for k, v in aws_s3_bucket_inventory.s3_bucket_inventories : k => one(v.filter) if v.filter != null && length(v.filter) > 0 }
}
output "s3_bucket_inventories_included_object_versions" {
  description = "Map of included_object_versions values across all s3_bucket_inventories, keyed the same as var.s3_bucket_inventories"
  value       = { for k, v in aws_s3_bucket_inventory.s3_bucket_inventories : k => v.included_object_versions if v.included_object_versions != null && length(v.included_object_versions) > 0 }
}
output "s3_bucket_inventories_name" {
  description = "Map of name values across all s3_bucket_inventories, keyed the same as var.s3_bucket_inventories"
  value       = { for k, v in aws_s3_bucket_inventory.s3_bucket_inventories : k => v.name if v.name != null && length(v.name) > 0 }
}
output "s3_bucket_inventories_optional_fields" {
  description = "Map of optional_fields values across all s3_bucket_inventories, keyed the same as var.s3_bucket_inventories"
  value       = { for k, v in aws_s3_bucket_inventory.s3_bucket_inventories : k => v.optional_fields if v.optional_fields != null && length(v.optional_fields) > 0 }
}
output "s3_bucket_inventories_region" {
  description = "Map of region values across all s3_bucket_inventories, keyed the same as var.s3_bucket_inventories"
  value       = { for k, v in aws_s3_bucket_inventory.s3_bucket_inventories : k => v.region if v.region != null && length(v.region) > 0 }
}
output "s3_bucket_inventories_schedule" {
  description = "Map of schedule values across all s3_bucket_inventories, keyed the same as var.s3_bucket_inventories"
  value       = { for k, v in aws_s3_bucket_inventory.s3_bucket_inventories : k => one(v.schedule) if v.schedule != null && length(v.schedule) > 0 }
}

