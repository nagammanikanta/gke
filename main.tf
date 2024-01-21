resource "kubernetes_deployment" "frontend" {
  metadata {
    name = "frontend"
    labels = {
      test = "frontend"
    }
  }

  spec {
    replicas = 3

    selector {
      match_labels = {
        test = "webapp"
      }
    }

    template {
      metadata {
        labels = {
          test = "webapp"
        }
      }

      spec {
        container {
          image = "nginx:1.21.6"
          name  = "sample-webapp"
          port {
            container_port = 8080
            protocol       = "TCP"
          }
        }
      }
    }
  }
}
#********* service*****************

resource "kubernetes_service" "svc" {
    depends_on = [kubernetes_deployment.frontend]
  metadata {
    name = "frontend"
  }
  spec {
    selector = {
      test = "webapp"
    }
    port {
      port        = 80
      target_port = 8080
    }

    type = "LoadBalancer"
  }
  
}

