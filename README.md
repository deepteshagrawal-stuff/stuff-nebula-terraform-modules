# stuff-nebula-terraform-modules
## Overview
This repository contains terraform modules that can be called by development teams inside of their terraform code to generate the infrastucture they desire. The modules inside of this repository can be referenced using a git url as the source of a module referenced in a new piece of terraform code. So long as the variables required by the module are provided the desired infrastucture will be generated and the information that is released by the module will be avaliable.

For more reading on terraform please reference the terraform documentation. It is worth taking some time to be taught by another or learn the basics of terraform before utilising these modules.

https://www.terraform.io/intro

https://learn.hashicorp.com/collections/terraform/aws-get-started

## Implementation
Once you have a basic understanding of terraform you can begin generating your application infrastucture. To begin you want to run the following folder stucture:
```
terraform
├── configuration
│   ├── dev.tfvars
│   ├── prod.tfvars
│   ├── qa.tfvars
│   └── uat.tfvars
├── main.tf
├── output.tf
├── policies
│   └── example-policy.json.tpl
├── providers.tf
└── variables.tf
```
This can be generated using the following commands:
```
mkdir terraform
mkdir terraform/policies
mkdir terraform/configuration
touch terraform/configuration/dev.tfvars
touch terraform/configuration/test.tfvars
touch terraform/configuration/prod.tfvars
touch terraform/main.tf
touch terraform/variables.tf
touch terraform/provider.tf
```
File/Folder | Description | Other notes
-------------------------------------------|-------------------------------------------|-------------------------------------------
**Main.tf** | The main.tf file is | notes
**Output.tf** | The output.tf file | dd
**Variables.tf** | The Variables.tf file is.. | https://www.terraform.io/language/values/variables
**Provider.tf** | The provider.tf file is... | dkwapodkwada
**Configuration files** | The configuration files provide a key=value pair for each of the expected variables inside of the terraform code. Each environment has a unique configuration file that is passed upon running the terraform code for the respective environment. | All of the variables that are passed through the configuration files must be specified inside of the variables.tf file. All variables declared in the variables.tf file must be included in the configuration files unless a default value is declared.
**Policy files** | dwaodwopk | doawkdpwa

## Calling the modules
How to call modules...

## PAT token access
How to ensure your pipeline has access to retrieve the terraform modules

## Other
Other notes...
