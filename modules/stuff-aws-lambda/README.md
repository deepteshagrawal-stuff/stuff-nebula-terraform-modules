## stuff-nebula-sqs-with-dlq-module
Module for generating an AWS Lambda along with layers, function url (if required)

### Variables ###

Variable | Description
-------------------|----------------------------------------------
function_filename	    zip file name along with path.	
function_name	        lambda function name.	
function_description	lambda function description.	
function_sourcefile	    source file along with path to be zipped.	
function_role	        iam role resource arn.	
function_handler	    handler method in the source file.	
function_runtime	    function supported runtime.	
create_lambda_layer	    any non blank value. default to empty as "no" to create/use lambda layer.	
function_timeout	    lambda function timeout in seconds. default to 30 seconds.
function_env_vars	    key value pairs to set as environment variables. default to empty map.
create_lambda_url	    any non blank value. default to empty as "no" to generate function url.	
layer_filename	        zip layer file name along with its path.	
layer_name	            name of the layer.	
layer_runtimes	        lambda function layer supported runtimes.	
