provider "argocd" {
  server_addr = var.argocd_server
  username    = var.argocd_username
  password    = var.argocd_password
  insecure    = true
}

resource "argocd_repository" "repo" {
  repo     = var.repo_url
  type     = "git"
  insecure = true
}

resource "argocd_application" "apps" {
  metadata {
    name      = "applications"
    namespace = "argocd"
  }

  spec {
    project = "default"
    source {
      repo_url        = var.repo_url
      path            = "apps"
      target_revision = "HEAD"
    }
    destination {
      server    = "https://kubernetes.default.svc"
      namespace = "argocd"
    }
    sync_policy {
      automated {
        prune     = true
        self_heal = true
      }
    }
  }
}

