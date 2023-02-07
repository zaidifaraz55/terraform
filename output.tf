output "instance" {
value = google_compute_instance.default.name
}

output "snapshot" {
value = google_compute_snapshot.snapshot.name
}

output "attached_disk" {
value = google_compute_attached_disk.default.id
}
output "snap_policy" {
value = google_compute_resource_policy.bar.id
}