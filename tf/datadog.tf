resource "datadog_integration_aws" "main" {
  account_id = "654404853695"
  role_name  = "DatadogIntegrationRole"
  host_tags  = ["terraform:true"]
} 