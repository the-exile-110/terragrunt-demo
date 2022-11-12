include "root" {
  path = find_in_parent_folders()
}

locals {
  environment_locals = read_terragrunt_config(find_in_parent_folders("env.hcl"))

  tg_vars = merge(local.environment_locals.locals)

  env = local.tg_vars.env_vars.env
}

# get values from depended resource outputs
dependency "iam_role" {
  config_path  = "../iam_role"
  mock_outputs = {
    iam_role_name = "iam-role-name"
  }
}

inputs = {
  iam_role_name = dependency.iam_role.outputs.iam_role_name
}
