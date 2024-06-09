# Bucket where we will store our file
resource "google_storage_bucket" "gcp_state_bucket" {
    name     = "bucket_name" #Put your backet name
    location = "US-CENTRAL1"

    versioning {
        enabled = true
    }
  
    # Specify encryption settings with the ID of the key used for encryption
    encryption {
        default_kms_key_name = google_kms_crypto_key.state_state_bucket.id
    }

    depends_on = [google_kms_crypto_key_iam_member.crypto_key]
}

# Key ring for storing keys
resource "google_kms_key_ring" "dos18_state_bucker_key_ring" {
    name     = "key-ring"
    location = "us-central1"
}

# The key itself
resource "google_kms_crypto_key" "state_state_bucket" {
    name     = "bucket-state-key"
    key_ring = google_kms_key_ring.dos18_state_bucker_key_ring.id
}

# Grant permissions to the service account that manages buckets
resource "google_kms_crypto_key_iam_member" "crypto_key" {
    crypto_key_id = google_kms_crypto_key.state_state_bucket.id
    role          = "roles/cloudkms.cryptoKeyEncrypterDecrypter"
    member        = "$(SERVICE_ACC_CLSTR)" // This is the service account specifically for Cloud Storage (default service account for Google Storage)
}
