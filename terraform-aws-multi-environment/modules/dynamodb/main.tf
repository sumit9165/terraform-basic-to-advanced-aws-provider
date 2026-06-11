# dynamodb
resource "aws_dynamodb_table" "my-dynamodb1-table" {
  name  = "${var.env}-${var.dynamodb_table_count}-${count.index + 1}"
  count = var.dynamodb_table_count
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
  tags = {
    Environment = var.env
  }
}