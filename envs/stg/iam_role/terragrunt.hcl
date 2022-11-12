include "root" {
  path = find_in_parent_folders()
}

locals {
  environment_locals = read_terragrunt_config(find_in_parent_folders("env.hcl"))

  tg_vars = merge(local.environment_locals.locals)
}

inputs = {
  env = local.tg_vars.env_vars.env
}