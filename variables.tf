variable "token" {
  default = ""
  description = "Your github token set with TF_VAR_token (not GITHUB_TOKEN)"
  type = string
}

variable "unencrypted_secret" {
  default = "blurpie"
  description = "Testing secret locally without sops."
  type = string
}