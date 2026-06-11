# s3
resource "aws_s3_bucket" "testbucket" {
    bucket = "babylone-1234"
    tags = {
        Name = "babylone-1234"
    }
}


# dynamodb
resource "aws_dynamodb_table" "my-dynamodb-table" {
  name           = "babylone-1234-table"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}