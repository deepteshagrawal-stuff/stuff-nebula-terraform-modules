/* Queue details */
variable "queue_name" {
  type = string
  description = "The name of the queue to be created"
}

variable "fifo_queue" {
  type = bool
  description = "FIFO queue?"
}

variable "delay_seconds" {
  type = number
  description = "Time from message creation until it is available to read"
}

variable "message_retention" {
  type = number
  description = "How long messages are retained until deletion"
}
