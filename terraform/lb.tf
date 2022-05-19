resource "aws_lb" "alb" {
  name               = "alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb-sg.id]
  subnets            = [module.network.sub-public_one_id,module.network.sub-public_two_id] 
  tags = {
    name = "prod-alb"
  }
}
resource "aws_lb_target_group" "tg" {
  name        = "lb-tg"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = module.network.vpc_id
}
# resource "aws_lb_target_group_attachment" "tg-attachment" {
#   target_group_arn = aws_lb_target_group.tg.arn
#   target_id        = aws_instance.bastion-ec2.id
#   port             = 80
# }
resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.alb.arn
  port              = "80"
  protocol          = "HTTP"
  
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}

