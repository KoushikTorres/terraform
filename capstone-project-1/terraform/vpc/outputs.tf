output "vpc_id" {
  value = aws_vpc.vpc-1.id
}
output "public_subnet_id" {
  value = aws_subnet.public.id
}