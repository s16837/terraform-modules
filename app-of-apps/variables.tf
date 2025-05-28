variable "repo_url" {}
variable "repo_username" {
  default = ""
}
variable "repo_password" {
  default = ""
}
variable "revision" {
  default = "main"
}
variable "app_path" {
  description = "Ścieżka do katalogu aplikacji w repozytorium"
}
variable "destination_server" {
  default = "https://kubernetes.default.svc"
}
variable "destination_namespace" {
  default = "argocd"
}
variable "argocd_namespace" {
  default = "platform-dev"
}

variable "project" {
  default = "default"
}