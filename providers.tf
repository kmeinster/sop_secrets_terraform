terraform {
  required_providers {

    github = {
      source  = "integrations/github"
      version = "4.10.1"
    }
    sops = {
      source = "carlpett/sops"
      version = "0.6.3"
    }
//    github = {
//      source = "~/.terraform.d/plugins/kubeist/local/github-secrets"
//      version = "0.1"
//    }
  }
}



provider "github" {
  token = var.token
  owner = "kmeinster"
}

provider "sops" {
  # Configuration options
}

provider "aws" {
  region = "eu-west-1"
}

