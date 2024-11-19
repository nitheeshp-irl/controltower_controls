provider "aws" {
  region = var.region
}

module "aws_controls" {
  source = "https://github.com/nitheeshp-irl/blog_terraform_modules/awscontroltower-controls_module"

  aws_region = var.aws_region
  controls   = var.controls
}
