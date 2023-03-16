terraform {
    backend "s3" {
        bucket = "exam_project_app"
        key    = "terraform.tfstate"
        region = "us-east-1"
    }
}