terraform {
  backend "s3" {
    bucket = "terraform-ktest-1"
    key    = "terraform/statefile"
    region = "us-east-1"
  }
}
