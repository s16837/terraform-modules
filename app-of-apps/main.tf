
resource "argocd_repository" "test_deployment" {
  repo = var.repo_url
  username = var.repo_username
  password = var.repo_password
  insecure = true
  type = "git"
}

resource "argocd_application" "applications" {
  metadata {
    name      = "applications"
    namespace = var.argocd_namespace
  }

  spec {
    project = var.project

    source {
      repo_url        = var.repo_url
      target_revision = var.revision
      path            = var.app_path
    }

    destination {
      server    = var.destination_server
      namespace = var.destination_namespace
    }

    sync_policy {
      automated {
        self_heal = true
        prune     = true
      }
    }
  }
}