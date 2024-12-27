  variable Terraform{
    default = "true"
  } 
  variable Environment{
    default = "Dev"
  } 
  variable Project{
    default = "Expense"
  } 
variable azs{
    type=list(string)
    default = [ "us-east-1a", "us-east-1b"]
}
variable public_cidr{
    type=list(string)
    default = [ "10.0.1.0/24", "10.0.2.0/24" ]
}
variable private_cidr{
    type=list(string)
    default = [ "10.0.11.0/24", "10.0.12.0/24" ]
}
variable database_cidr{
    type=list(string)
    default = [ "10.0.21.0/24", "10.0.22.0/24" ]
}