## stuff-nebula-sqs-module
Module for generating an AWS SQS Queue for an application

### Variables ###

Variable | Description | Default
-------------------|----------------------------------------------|-------------------
queue_name | The name of the queue to be created |
delay_seconds | Time from message creation until it is available to read |
message_retention | How long messages are retained until deletion |
fifo_queue | FIFO queue? | false
