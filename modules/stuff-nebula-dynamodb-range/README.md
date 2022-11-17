## stuff-nebula-dynamodb-range-module
Module for generating an AWS DynamoDB table for an application

This will be a simple table that uses a Primary key (string) and a Range key (string)
Provisioning or Pay Per Request mode can be selected
TTL and Point in Time can also be set

### Variables ###

Variable | Description | Default
---------------|--------------------------------------------------------|---------------
table_name| The name of the table to be created |
hash_key | Primary key for the table |
range_key | Range (sort) key for the table |
provisioned | Set to false to use PAY_PER_REQUEST | true
read_capacity | The capacity units allocated for reading | 1
write_capacity | The capacity units allocated for writing | 1
ttl_name | Time to Live timestamp field name | time_to_expire
ttl_enabled | Enable Time to Live | false
pit_enabled | Enable Point in Time recovery | false

