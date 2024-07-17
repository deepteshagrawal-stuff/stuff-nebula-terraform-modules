## stuff-aws-iamrole-policy module
## **Overview**
This module is used to generate IAM role with inline policies or external policies only when create_role is true.
It is also used to generate policies when create_policy is true.
If a role and policy both are generated using this module, then the policy can be associated with role too by providing create_policy_attachment to true.
If any of the role or policy is generated using this module and want to attach together, then use role_to_attach/policy_to_attach variables to provide the information which is not generated using this module by either providing role name or policy arn along with create_policy_attachment to true.
If none of the role or policy is generated using this module and just want to attach together, then provide role name in role_to_attach and policy arn in policy_to_attach along with create_policy_attachment to true.

Default values of all these variables are blank or empty map or false to avoid define them even if don't want to use that resource.

The output of this module is to print the resource details which get generated with this module.
iam_role_details - Role resource details.
iam_policy_details - Policy resource details.
iam_role_policy_attachment - Attachment of Resource and Policy details.

Note: The output of these objects could be "null" if its not created by this module.


## **Variables**
Only default attribute is the only way to differentiate between a mandatory and an optional attribute and hence most of the attributes are kept Blank or Empty to avoid defining them unnecessarily.

Variable | Description | Default
-------------------|----------------------------------------------|-------------------
role_name                   | Name of the IAM role. | Blank
role_description            | Description of the IAM role. | Blank
role_service                | Name of the AWS service assumed by the role. | Blank
inline_policies             | A map of inline policies. It will not get created if map is empty. | Empty
policy_name                 | Name of the IAM policy. | Blank
policy_description          | Description of the IAM policy. | Blank
allow_policy_actions        | List of actions allowed by the policy. | Empty List
allow_policy_resources      | List of ARNs for resources allowed by the policy. | Empty List
create_role                 | Does role need to be created. | False
create_policy               | Does policy need to be created. | False
create_policy_attachment    | Does policy need to be attached to the role. | False
role_to_attach              | Name of the role to attach if its not created using this module. this is only relevant if create_role is false.     | Blank
policy_to_attach            | ARN of the policy to attach if its not created using this module. this is only releavant if create_policy is false. | Blank


## **Usage**

1. Creating Role.
```
module "iamrole_policy_module" {
  source                  = "../stuff-aws-iamrole-policy/"
  create_role             = true
  role_name               = "role name"
  role_description        = "role description"
  role_service            = "lambda.amazonaws.com"
  role_inline_policies    = local.inline_policies
}
```

2. Creating Policy.
```
module "iamrole_policy_module" {
  source                  = "s3::https://stuff-terraform-nebula-modules.s3.ap-southeast-2.amazonaws.com/stuff-aws-iamrole-policy/1.0.2.zip"
  create_policy           = true
  policy_name             = "policy name"
  policy_description      = "policy description"
  allow_policy_actions    = ["s3:GetObject", "s3:PutObject"]
  allow_policy_resources  = [ for res in local.s3_policy_resources : "arn:aws:s3:::${res.s3_resource_bucket_name}/${res.s3_resource_file_key}" ]
}
```

3. Creating policy and attach to the role (role which is not created in the same module).
```
module "iamrole_policy_module" {
  source                  = "s3::https://stuff-terraform-nebula-modules.s3.ap-southeast-2.amazonaws.com/stuff-aws-iamrole-policy/1.0.2.zip"
  create_policy           = true
  policy_name             = "policy name"
  policy_description      = "policy description"
  allow_policy_actions    = ["s3:GetObject", "s3:PutObject"]
  allow_policy_resources  = [ for res in local.s3_policy_resources : "arn:aws:s3:::${res.s3_resource_bucket_name}/${res.s3_resource_file_key}" ]
  create_policy_attachment = true
  role_to_attach          = "role name to attch"
}
```

4. Creating role and policy and attach them together.
```
module "iamrole_policy_module" {
  source                  = "s3::https://stuff-terraform-nebula-modules.s3.ap-southeast-2.amazonaws.com/stuff-aws-iamrole-policy/1.0.2.zip"
  create_role             = true
  role_name               = "role name"
  role_description        = "role description"
  role_service            = "lambda.amazonaws.com"
  role_inline_policies    = local.inline_policies
  create_policy           = true
  policy_name             = "policy name"
  policy_description      = "policy description"
  allow_policy_actions    = ["s3:GetObject", "s3:PutObject"]
  allow_policy_resources  = [ for res in local.s3_policy_resources : "arn:aws:s3:::${res.s3_resource_bucket_name}/${res.s3_resource_file_key}" ]
  create_policy_attachment = true
}
```

5. Creating policy attachment.
module "iamrole_policy_module" {
  source                  = "s3::https://stuff-terraform-nebula-modules.s3.ap-southeast-2.amazonaws.com/stuff-aws-iamrole-policy/1.0.2.zip"
  create_policy_attachment = true
  role_to_attach          = "name of the role"
  policy_to_attach        = "arn of the policy"
}
