data "sops_file" "secret-data" {
  source_file = "secrets.json"
}
//
//data "sops_file" "secret-configs" {
//  source_file = "secret-configs.json"
//}
//
//output "secret_key" {
//  value = data.sops_file.secret-data.data["topics.identity.secret_name"]
//}
//
//output "secret_key2" {
//  value = data.sops_file.secret-configs.data["topics.identity.secret_name2"]
//}

data "github_actions_public_key" "this" {
  repository = "secret-example"
}

data "local_file" "secret-file" {
  filename = "secrets.json"
}

data "sops_external" this {
  source = data.local_file.secret-file.content
  input_type = "json"
}

//locals {
//  secrets = flatten([
//    for k, v in data.sops_file.secret-data.data : [
//        for idx in range(v.key) : {
//    repo = v
//    }]
//  ])
//}

output "repos" {
  value = data.sops_file.secret-data.data
}

resource "github_actions_secret" "this" {
//  for_each = {
//  for k, v in data.sops_file.secret-data.data :
//  k => data.sops_file.secret-data.data[k]
//  }
  for_each = data.sops_file.secret-data.data
//  for_each = local.secrets
//  plaintext_value = data.sops_file.secret-data.data["repositories.secret-example.secret_name"]
//  plaintext_value = var.unencrypted_secret
  plaintext_value = each.value
  repository = each.key
//  secret_name = each.key
  secret_name = each.value
}