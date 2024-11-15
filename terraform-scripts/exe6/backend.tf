terraform {
  backend "s3" {
    bucket = "terra-state-dovee"
    key    = "huz-terra/backend"
    region = "us-east-1"
  }
}
