## stuff-nebula-dynamodb-simple-module
Module for generating an AWS DynamoDB table for an application

This will be a simple table that only uses a Primary key (string)
Provisioning or Pay Per Request mode can be selected
TTL and Point in Time can also be set

### Variables ###

table_name: The name of the table to be created
hash_key: Primary key for the table

provisioned: Set to false to use PAY_PER_REQUEST (default is true)
read_capacity: The capacity units allocated for reading (default is 1)
write_capacity: The capacity units allocated for writing (default is 1)

ttl_name: Time to Live timestamp field name (default is time_to_expire)
ttl_enabled: Enable Time to Live (default is false)

pit_enabled: Enable Point in Time recovery (default is false)

