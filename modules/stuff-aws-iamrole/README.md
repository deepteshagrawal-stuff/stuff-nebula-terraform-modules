## stuff-nebula-sqs-with-dlq-module
Module for generating an AWS IAM Role and IAM Policies and associate them with the roles.

### Variables ###

Variable | Description
-------------------|----------------------------------------------|-------------------
role_name               Name of the IAM role.
role_description        Description of the IAM role.
role_service            Name of the AWS service assumed by the role.
policy_name             Name of the IAM policy.
policy_description      Description of the IAM policy.
allow_policy_actions    List of actions allowed by the policy.
allow_policy_resources  List of ARNs for resources allowed by the policy.
