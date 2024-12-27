resource "aws_ssm_parameter" "vpc_id" {
  name  = "/Expense/dev/Vpc_id"      # Parameter name in SSM
  type  = "String"             # SSM Parameter type
  value = aws_vpc.vpc.id
   lifecycle {
    create_before_destroy = true
  }
}

resource "aws_ssm_parameter" "public_subnet_ids" {
  name  = "/Expense/dev/public_subnet_ids"
  type  = "StringList"
  value = join(",", aws_subnet.public_subnet[*].id)
   lifecycle {
    create_before_destroy = true
  }
}

resource "aws_ssm_parameter" "private_subnet_ids" {
  name  = "/Expense/dev/private_subnet_ids"
  type  = "StringList"
  value = join(",", aws_subnet.private_subnet[*].id)
   lifecycle {
    create_before_destroy = true
  }
}



