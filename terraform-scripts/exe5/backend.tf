terraform {
  backend "s3" {
    bucket = "terra-state-dovee"
    key    = "terra/backend"
    region = "us-east-1"
  }
}
