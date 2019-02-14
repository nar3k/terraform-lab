variable "public_key_path" {
  description = "Path to public key file"
}

variable "token" {
  description = "Yandex Cloud security OAuth token"
}

variable "folder_id" {
  description = "Yandex Cloud Folder ID where resources will be created"
}

variable "cloud_id" {
  description = "Yandex Cloud ID where resources will be created"
}

variable "zones" {
  description = "Yandex Cloud default Zone for provisoned resources"
  default = ["ru-central1-a","ru-central1-b","ru-central1-c"]
}
