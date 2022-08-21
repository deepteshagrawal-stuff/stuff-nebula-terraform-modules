resource "aws_sqs_queue" "sqs_dlq" {
  name                        = var.dlq_queue_name
  delay_seconds               = var.dlq_delay_seconds
  message_retention_seconds   = var.dlq_message_retention
}

resource "aws_sqs_queue" "sqs" {
  name                        = var.queue_name
  delay_seconds               = var.delay_seconds
  message_retention_seconds   = var.message_retention
  visibility_timeout_seconds  = var.retry_wait_time
  redrive_policy              = jsonencode({
    deadLetterTargetArn       = aws_sqs_queue.sqs_dlq.arn
    maxReceiveCount           = var.retry_count
  })
}
