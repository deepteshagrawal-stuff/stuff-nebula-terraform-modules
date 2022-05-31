# stuff-nebula-terraform-modules
## **Overview**
This repository contains terraform modules that can be called by development teams inside of their terraform code to generate the infrastucture they desire. The modules inside of this repository can be referenced using a git url as the source of a module referenced in a new piece of terraform code. So long as the variables required by the module are provided the desired infrastucture will be generated and the information that is released by the module will be avaliable.

For more reading on terraform please reference the terraform documentation. It is worth taking some time to be taught by another or learn the basics of terraform before utilising these modules.

https://www.terraform.io/intro

https://learn.hashicorp.com/collections/terraform/aws-get-started

*If the modules do not provide sufficent implementation options but are a good outline you can always use the module source code directly inside of you're terraform implementation and expand from there. Or refer the required change to infrastucture team. Ideally along with a pull request with you're required change!* 

## **Implementation**
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
This can be generated using the following commands (also contained in the shell script ./terraform.sh):
```
mkdir terraform
mkdir terraform/policies
mkdir terraform/configuration
touch terraform/configuration/dev.tfvars
touch terraform/configuration/qa.tfvars
touch terraform/configuration/uat.tfvars
touch terraform/configuration/prod.tfvars
touch terraform/main.tf
touch terraform/variables.tf
touch terraform/provider.tf
```
File/Folder | Description | Other notes
-------------------------------------------|-------------------------------------------|-------------------------------------------
**Main.tf** | The main.tf file defines the terraform code that is going to be run upon execution. Inside of this file in your terraform code you will declare and provide configuration for the modules and resources that is going to make up your infrastucture. | Everything runs from the main.tf. When referencing a variable inside of the main.tf you must have that variable declared in variable.tf file located inside of the same folder as the main.tf 
**Output.tf** | The output.tf file defines the values from the main.tf that you want to expose after the infrastucture code has been executed. | The output.tf exposes the values and assigns the given name to the value as the key for retrieving the value. You can output these values well inside of the folder once the code has been executed using the following example command line execution: `terraform output -raw "output_name"`. https://www.terraform.io/language/values/outputs
**Variables.tf** | The variables.tf file declares the variables that will be available to the main.tf file. Once a variable is declared in this file it can now be referenced inside of the main.tf and used there. | Variables declared in this file must either be provided via a .tfvars files and/or have a default value or the main.tf will fail to execute if it references this variable as the value will be null. https://www.terraform.io/language/values/variables
**Provider.tf** | The provider.tf file informs our infrastcture code on the providers we will be using from the wide range of terraform providers avaliable. In our case we also declared our terraform back end location here. This informs the infrascture code on where to store the state of the infrascture. | https://www.terraform.io/language/providers
**Configuration files** | The configuration files provide a key=value pair for each of the expected variables inside of the terraform code. Each environment has a unique configuration file that is passed upon running the terraform code for the respective environment. | All of the variables that are passed through the configuration files must be specified inside of the variables.tf file. All variables declared in the variables.tf file must be included in the configuration files unless a default value is declared.


## **Calling Terraform modules**
Modules in Terraform follow the same format as the terraform code that you are declaring inside of your own terraform code. The a comprised of the same main.tf, variables.tf, output.tf etc. When you are calling a module you must provide all of the variables it declares inside of the variables.tf that do not have a default value or else just as in our code the module will fail as a value has a null value. When the module is then executed it instaties the infrastucture that is declared then outputs the values delcared in the output.tf back to your main.tf file where you called the module for that output configuration to be used.

### Calling the modules declared in this github repository:
***When calling the modules declared in this repository you must be using a github service connection that has access to read from these repositories!*** <br />
Here is an example of calling on of the modules declared inside of this repository. Please note the `//` inside of the module URL after the repository name is declared and before the folder containing the module is declared. <br />
```hcl
module "pod_service_account_role" {
  source             = "github.com/StuffNZ/stuff-nebula-terraform-modules//stuff-nebula-pod-sa-role"
  name               = var.name
  environment        = var.environment
  oidc_issuer_url    = var.oidc_issuer_url
  namespace          = var.namespace
  cluster_account_id = data.aws_caller_identity.current.account_id
}
```
More reading: https://www.terraform.io/language/modules/sources

## **Reference Implementation Repositories**

The following repositories have implemented terraform code using these repository as a reference point and using the terraform modules provided inside of this repository.

https://github.com/StuffNZ/stuff-experience-nebula-frontend/tree/main/terraform

https://github.com/StuffNZ/stuff-eventing-service

https://github.com/StuffNZ/stuff-provisioning-service

https://github.com/StuffNZ/stuff-content-service-nebula

## Other notes:

Terraform has great documentation that is constantly being maintained and updated. This README.md should be updated often however please reference the Terraform docs for further and updated information on any topic: https://www.terraform.io/language