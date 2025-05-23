provider "aws" {
  region = "us-east-1"
}

provider "datadog" {
  api_url = "https://api.datadoghq.eu/"
  validate = false
  app_key = var.datadog_app_key
}

terraform {
  required_providers {
    datadog = {
      source  = "datadog/datadog"
      version = "~> 3.0"
    }
  }
}
