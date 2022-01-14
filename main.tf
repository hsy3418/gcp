# variable "region" {
#     type = string
# }

# variable "image" {
#     type = string
# }

resource "google_redis_instance" "cache" {
  name           = "ha-memory-cache"
  tier           = "STANDARD_HA"
  memory_size_gb = 1

  location_id             = "australia-southeast2-a"

  authorized_network = "vpc-1"
    
  redis_version     = "REDIS_6_X "
  display_name      = "Terraform Test Instance"

  labels = {
    my_key    = "my_val"
    other_key = "other_val"
  }

  auth_enabled = true
  transit_encryption_mode = SERVER_AUTHENTICATION
}

output google_redis_instance {
    value  = google_redis_instance.cache
}

# resource "google_cloud_run_service" "cloudrun_ld_relay_np" {
#   provider = google-beta
#   name     = "cloudrun-ld-relay_np"
#   location = var.region
#   template {
#     spec {
#       containers {
#         ports {
#           name           = "http1"
#           container_port = "8030"
#         }
#         image = var.image
#         env {
#           name  = "AUTO_CONFIG_KEY"
#           value_from {
#             secret_key_ref {
#                 name = google_secret_manager_secret.relay_auto_config_key_2.secret_id
#                 key = "latest"
#             }
#           }
#         }
#         env {
#           name = "REDIS_HOST"
#           value_from {
#             secret_key_ref {
#                 name = google_secret_manager_secret.cloudrun_ld_relay_proxy.secret_id
#                 key  = "2"
#             }
#           }
#         }
#       }
#         service_account_name = "${google_service_account.service_account.email}"
#     }
#     metadata {
#       annotations = {
#         "autoscaling.knative.dev/maxScale"        = 4
#         "autoscaling.knative.dev/minScale"        = 2
#         "run.googleapis.com/vpc-access-egress"    = "all-traffic"
#         "run.googleapis.com/vpc-access-connector" = "vpcac-93ec35"
#       }
#     }
#   }
 
#   traffic {
#     percent         = 100
#     latest_revision = true
#   }
   
# metadata {
#     annotations = {
#       "run.googleapis.com/launch-stage" = "BETA"
#       "run.googleapis.com/ingress"      = "internal"
#     }
#   }
 
# }