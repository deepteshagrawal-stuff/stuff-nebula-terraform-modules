## stuff-nebula-sqs-with-dlq-module
Module for generating an AWS SQS Queue with DLQ and redrive policy for an application

### Variables ###

Variable | Description | Default
-------------------|----------------------------------------------|-------------------
dlq_queue_name | The name of the DLQ to be created | service-function-dlq
dlq_delay_seconds | Time from message creation until it is available to read | 5
dlq_message_retention | How long messages are retained until deletion | 604800
queue_name | The name of the queue to be created | service-function
delay_seconds | Time from message creation until it is available to read | 5
message_retention | How long messages are retained until deletion | 86400
retry_count | How many retries will occur | 4
retry_wait_time | How many seconds before a retry occurs | 30
