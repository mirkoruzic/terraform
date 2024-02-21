output "ecs_cluster_arn" {
  value = aws_ecs_cluster.cluster.arn
}

output "ecs_service_arn" {
  value = aws_ecs_service.service.id
}

output "alb_dns_name" {
  value = aws_lb.alb.dns_name
}

output "target_group_arn" {
  value = aws_lb_target_group.tg.arn
}
