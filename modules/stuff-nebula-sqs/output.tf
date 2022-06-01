output "sqs_queue_url" {
  description = "The URL for the SQS queue"
  value       = aws_sqs_queue.sqs.id
}

output "sqs_queue_arn" {
  description = "The ARN for the SQS queue"
  value       = aws_sqs_queue.sqs.arn
}
