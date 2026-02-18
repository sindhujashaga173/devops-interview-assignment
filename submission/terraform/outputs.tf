output "vpc_id" {
  value = aws_vpc.main.id
}

output "eks_cluster_endpoint" {
  value = aws_eks_cluster.main.endpoint
}

output "private_subnet_ids" {
  value = [
    aws_subnet.private_a.id,
    aws_subnet.private_b.id
  ]
}

output "public_subnet_ids" {
  value = [
    aws_subnet.public_a.id,
    aws_subnet.public_b.id
  ]
}

output "nat_eip" {
  value = aws_eip.nat.public_ip
}



