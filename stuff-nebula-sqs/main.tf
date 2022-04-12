resource "aws_sqs_queue" "sqs" {
  name                        = var.queue_name
  delay_seconds               = var.delay_seconds
  message_retention_seconds   = var.message_retention
  fifo_queue                  = var.fifo_queue
  content_based_deduplication = true
}
