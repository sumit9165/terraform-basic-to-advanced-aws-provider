variable "aws_dynamodb_table_name" {
    description = "This variable holds the DynamoDB table name"
    default = "babylone-123-table"
    type = string
}

variable "env" {
    description = "This variable holds the environment type"
    type = string
}

variable "dynamodb_table_count" {
    description = "This variable holds the number of DynamoDB tables to create"
    type = number
}