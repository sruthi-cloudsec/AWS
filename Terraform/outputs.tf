output "bucket_name" {
   value = aws_s3_bucket.my_bucket.id
}
output "role_arn" {
   value = aws_iam_role.s3_access_role.arn
}
