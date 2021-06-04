data "archive_file" "file" {
  type        = "zip"
  source_dir  = var.source_path
  output_path = "build/${var.artifact_name}.zip"
}

resource "aws_s3_bucket_object" "object" {
  bucket = var.bucket_name
  key    = "build/${var.artifact_name}.zip"
  source = data.archive_file.file.output_path
  etag   = data.archive_file.file.output_md5
}



