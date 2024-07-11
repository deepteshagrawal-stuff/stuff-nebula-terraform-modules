## stuff-nebula-sqs-with-dlq-module
Module for generating an AWS IAM Role and IAM Policies and associate them with the roles.

### Variables ###

Variable | Description
-------------------|----------------------------------------------|-------------------
role_name               Name of the IAM role.
role_description        Description of the IAM role.
role_service            Name of the AWS service assumed by the role.
inline_policies         A map of inline policies. It will not get created if map is empty.