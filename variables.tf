variable "instancename" {
  type    = string
  default = "test"
}
variable "instancetype" {
  type    = string
  default = "e2-medium"
}
variable "zone" {
  type    = string
  default = "us-central1-a"
}
variable "image" {
  type    = string
  default = "debian-cloud/debian-11"
}
variable "diskname" {
  type    = string
  default = "test-disk"
}
variable "disktype" {
  type    = string
  default = "pd-ssd"
}
variable "diskimage" {
  type    = string
  default = "debian-11-bullseye-v20220719"
}
variable "snapname" {
  type    = string
  default = "my-snapshot"
}
