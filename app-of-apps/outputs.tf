output "app_name" {
  value = argocd_application.applications.metadata[0].name
}

