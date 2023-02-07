resource "google_compute_instance" "default" {
  name         = var.instancename
  machine_type = var.instancetype
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.image

    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }
}
resource "google_compute_disk" "default1" {
  name                      = var.diskname
  type                      = var.disktype
  zone                      = var.zone
  image                     = var.diskimage
  
}
resource "google_compute_attached_disk" "default" {
  disk     = google_compute_disk.default1.id
  instance = google_compute_instance.default.id
}
resource "google_compute_snapshot" "snapshot" {
  name              = var.snapname
  source_disk       = google_compute_disk.default1.id
  zone              = var.zone
  storage_locations = ["us-central1"]
}
resource "google_compute_resource_policy" "bar" {
  name   = "policy"
  region = "us-central1"
  snapshot_schedule_policy {
    schedule {
      hourly_schedule {
        hours_in_cycle = 20
        start_time     = "23:00"
      }
    }
    retention_policy {
      max_retention_days    = 10
      on_source_disk_delete = "KEEP_AUTO_SNAPSHOTS"
    }
    snapshot_properties {
      labels = {
        my_label = "value"
      }
      storage_locations = ["us"]
      guest_flush       = true
    }
  }
}