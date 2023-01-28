provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = "minikube"
}
provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}
terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.11"
    }
  }

  required_version = "~> 1.2"
}