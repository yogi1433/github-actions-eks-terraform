output "allow_all_sg_id" {
  description = "Security group ID for allowing all traffic"
  value       = aws_security_group.allow_all.id
}
