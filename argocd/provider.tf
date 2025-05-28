terraform {
  required_providers {
    helm = {
      source = "hashicorp/helm"
    }
  }
}

provider "argocd" {
  server_addr = "localhost:8080"    
  username    = "admin"
  password    = "dev"
  insecure    = true
}

