## stuff-aws-iamrole-policy module
Module for generating an AWS IAM Role with inline policies(optional) or IAM Policies (only Allow) and associate them with the roles based on the create variables.
The same module can be used to either create iam role or just allow iam policy document or to just associate an policy with iam role based on the boolean create variables.

### Variables ###

Variable | Description
-------------------|----------------------------------------------|-------------------
role_name                   Name of the IAM role.
role_description            Description of the IAM role.
role_service                Name of the AWS service assumed by the role.
inline_policies             A map of inline policies. It will not get created if map is empty.
policy_name                 Name of the IAM policy.
policy_description          Description of the IAM policy.
allow_policy_actions        List of actions allowed by the policy.
allow_policy_resources      List of ARNs for resources allowed by the policy.
create_role                 Does role need to be created.
create_policy               Does policy need to be created.
create_policy_attachment    Does policy need to be attached to the role.
