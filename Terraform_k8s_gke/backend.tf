terraform {
    backend "gcs"{
        bucket = "bucket_name" #Put your backet name
        prefix = "prefix_name"
         
    }
    
}