resource "kubernetes_namespace" "main" {
  metadata {
    name = var.project
  }
}
resource "helm_release" "main" {
  name      = var.project
  namespace = kubernetes_namespace.main.metadata[0].name
  chart     = "./helm/app"

  set {
    name  = "valuesChecksum"
    value = filemd5("./helm/app/values.yaml")
  }
  set {
    name  = "image.repository"
    value = "ghcr.io/benc-uk/nodejs-demoapp"
  }
  set {
    name  = "image.tag"
    value = "latest"
  }
  set {
    name  = "env.TODO_MONGO_CONNSTR"
    value = "mongodb://root:password@${var.project}-mongo.${var.project}.svc.cluster.local:27017/?retryWrites=false"
  }
  depends_on = [helm_release.mongo]
}
resource "helm_release" "mongo" {
  name       = "${var.project}-mongo"
  namespace  = kubernetes_namespace.main.metadata[0].name
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "mongodb"


  set {
    name  = "nameOverride"
    value = var.project
  }
  set {
    name  = "auth.rootUser"
    value = "root"
  }
  set {
    name  = "auth.rootPassword"
    value = "password"
  }
  set {
    name  = "valuesChecksum"
    value = filemd5("./helm/app/values.yaml")
  }
}