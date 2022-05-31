# stuff-nebula-sa-role-module
## **Overview**
This module is used to generate a AWS IAM role. The role generated can then be attached to a EKS service-account object using the service-account.yaml inside of the k8s repository (linked below). The role can then have further policies attached to it allowing the EKS service account the role is attached to a wide range of useful AWS permissions. <br />

The service account can then be attached to a deployment as seen in the deployment-template.yaml inside of the k8s repository providing that deployment with all of the permissions attached to the generated role.

k8s Template Repository: https://github.com/StuffNZ/stuff-nebula-k8s-templates

***This module is great for generating the role that can be attached to a service account to provide deployments access to `SSM parameter store`***. In the example implementation shown below with a repository link the terraform folder and terraform folder work together to generate a AWS IAM role and attach a SSM parameter store policy to that role then generate a secret provider to extract the parameters from parameter store using the policies provided via the IAM Role. This is achieved as the secret provider the deployment is mounted on has the service-account generated attached to it. 

## **Variables**
To use the following module you will have to declare the following variables during implementation.
Variable | Description | Default
---------------|--------------------------------------------------------|---------------
name | Name of the application the SSM service account is going to be used for | null
environment | Environment the service account is being used for | null
oidc_issuer_url | URL of the OIDC issuer bound to the cluster | null - You can obtain this using the following command well using a AWS service account with permission to describe the cluster. Execute: `aws eks describe-cluster --name $CLUSTER_NAME --query "cluster.identity.oidc.issuer" --output text`
namespace | Namespace of the service account. This has to match the namespace of the deployment the service account is being attached to. | null 
cluster_account_id | AWS account ID that holds the cluster that the service account is being deployed to | null

## **Example Implementation and Policy Attachment**

To implement this module inside of your terraform code the sa-role module can be implemented as shown in the code below under the module section. The policies can be implemented as shown below in the `aws_iam_role_policy` resource. This resource iterates through a `policies` variable that is declared as shown below and applies all of the linked policies.

Example repository: https://github.com/StuffNZ/stuff-eventing-service

`Module and policy attachment implementation example:`
```hcl
module "app_service_account" {
  source             = "github.com/StuffNZ/stuff-nebula-terraform-modules//stuff-nebula-pod-sa-role"
  name               = var.name
  oidc_issuer_url    = var.oidc_issuer_url
  namespace          = var.namespace
  cluster_account_id = data.aws_caller_identity.current.account_id
  environment        = var.environment
}

resource "aws_iam_role_policy" "policies" {
  count  = length(var.policies)
  role   = module.app_service_account.service_account_role.id
  name   = var.policies[count.index].name
  policy = file(var.policies[count.index].path)
}
```
`Policy variable:`
```hcl
variable "policies" {
  description = "A list of policys to append to the role generated for the service account"
  type = list(object({
    name = string
    path = string
    })
  )
}
```
`Passing the Policy Variable example:`
```hcl
policies = [
  {
    name = "ssm-policy"
    path = "./policies/ssm-policy.json.tpl"
  },
  {
    name = "sqs-policy"
    path = "./policies/sqs-policy.json.tpl"
  },
  {
    name = "dynamodb-policy"
    path = "./policies/dynamodb-policy.json.tpl"
  }
]
```