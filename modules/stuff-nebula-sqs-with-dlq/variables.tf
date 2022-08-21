/* Queue details */
variable "dlq_queue_name" {
  type = string
  description = "The name of the DLQ to be created"
}

variable "dlq_delay_seconds" {
  type = number
  description = "Time from message creation until it is available to read"
}

variable "dlq_message_retention" {
  type = number
  description = "How long messages are retained until deletion"
}

variable "queue_name" {
  type = string
  description = "The name of the queue to be created"
}

variable "delay_seconds" {
  type = number
  description = "Time from message creation until it is available to read"
}

variable "message_retention" {
  type = number
  description = "How long messages are retained until deletion"
}

variable "retry_count" {
  type = number
  description = "How many retries"
}

variable "retry_wait_time" {
  type = number
  description = "Seconds before the retry occurs"
}