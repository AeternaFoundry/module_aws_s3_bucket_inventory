resource "aws_s3_bucket_inventory" "s3_bucket_inventories" {
  for_each = var.s3_bucket_inventories

  bucket                   = each.value.bucket
  included_object_versions = each.value.included_object_versions
  name                     = each.value.name
  enabled                  = each.value.enabled
  optional_fields          = each.value.optional_fields
  region                   = each.value.region

  destination {
    bucket {
      account_id = each.value.destination.bucket.account_id
      bucket_arn = each.value.destination.bucket.bucket_arn
      dynamic "encryption" {
        for_each = each.value.destination.bucket.encryption != null ? [each.value.destination.bucket.encryption] : []
        content {
          dynamic "sse_kms" {
            for_each = encryption.value.sse_kms != null ? [encryption.value.sse_kms] : []
            content {
              key_id = sse_kms.value.key_id
            }
          }
          dynamic "sse_s3" {
            for_each = encryption.value.sse_s3 != null ? [encryption.value.sse_s3] : []
            content {
            }
          }
        }
      }
      format = each.value.destination.bucket.format
      prefix = each.value.destination.bucket.prefix
    }
  }

  schedule {
    frequency = each.value.schedule.frequency
  }

  dynamic "filter" {
    for_each = each.value.filter != null ? [each.value.filter] : []
    content {
      prefix = filter.value.prefix
    }
  }
}

