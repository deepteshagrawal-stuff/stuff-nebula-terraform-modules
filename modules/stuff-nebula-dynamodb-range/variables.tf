/* Simple Dynamodb table details */
variable "table_name" {
  type        = string
  description = "The name of the table to be created"
}

variable "provisioned" {
  type = bool
  default = true
  description = "Use provisioned capacity"
}

variable "read_capacity" {
  type        = number
  default     = 1
  description = "The capacity units allocated for reading"
}

variable "write_capacity" {
  type        = number
  default     = 1
  description = "The capacity units allocated for writing"
}

variable "hash_key" {
  type        = string
  description = "Primary key for the table"
}

variable "range_key" {
  type        = string
  description = "Range (sort) key for the table"
}

variable "ttl_name" {
  type        = string
  default     = "time_to_expire"
  description = "Time to Live timestamp field name"
}

variable "ttl_enabled" {
  type        = bool
  default     = false
  description = "Enable Time to Live"
}

variable "pit_enabled" {
  type        = bool
  default     = false
  description = "Enable Point in Time recovery"
}

