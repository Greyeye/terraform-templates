data "local_file" "env_variables" {
  filename = "./lambdaConfig/env_${var.environment}.json"
}

locals {
  env_variables = {
    name = var.project_name,
    terraform = true
    sampleConfigName = jsondecode(data.local_file.env_variables.content)["sampleConfigName"]
  }
}