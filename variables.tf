variable "s3_bucket_inventories" {
  description = <<EOT
Map of s3_bucket_inventories, attributes below
Required:
    - bucket
    - included_object_versions
    - name
    - destination (block):
        - bucket (required, block):
            - account_id (optional)
            - bucket_arn (required)
            - encryption (optional, block):
                - sse_kms (optional, block):
                    - key_id (required)
                - sse_s3 (optional, block):
            - format (required)
            - prefix (optional)
    - schedule (block):
        - frequency (required)
Optional:
    - enabled
    - optional_fields
    - region
    - filter (block):
        - prefix (optional)
EOT

  type = map(object({
    bucket                   = string
    included_object_versions = string
    name                     = string
    enabled                  = optional(bool)
    optional_fields          = optional(set(string))
    region                   = optional(string)
    destination = object({
      bucket = object({
        account_id = optional(string)
        bucket_arn = string
        encryption = optional(object({
          sse_kms = optional(object({
            key_id = string
          }))
          sse_s3 = optional(object({
          }))
        }))
        format = string
        prefix = optional(string)
      })
    })
    schedule = object({
      frequency = string
    })
    filter = optional(object({
      prefix = optional(string)
    }))
  }))
  # Note: 8 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

