resource "aws_instance" "frontend" {
  ami           = "ami-09c813fb71547fc4f"
  instance_type = "t3.small"
  vpc_security_group_ids = ["sg-06965018c3ac2742a"]

  tags = {
    Name = "frontend"
  }
}

resource "aws_route53_record" "frontend" {
  zone_id = "Z01256903NP1ETIISC009"
  name    = "frontend.dev.idevops25.online"
  type    = "A"
  ttl     = 15
  records = [aws_instance.frontend.private_ip]
}

resource "aws_instance" "mongo" {
  ami           = "ami-09c813fb71547fc4f"
  instance_type = "t3.small"
  vpc_security_group_ids = ["sg-06965018c3ac2742a"]

  tags = {
    Name = "mongo"
  }
}

resource "aws_route53_record" "mongo" {
  zone_id = "Z01256903NP1ETIISC009"
  name    = "mongo.dev.idevops25.online"
  type    = "A"
  ttl     = 15
  records = [aws_instance.mongo.private_ip]
}

resource "aws_instance" "catalogue" {
  ami           = "ami-09c813fb71547fc4f"
  instance_type = "t3.small"
  vpc_security_group_ids = ["sg-06965018c3ac2742a"]

  tags = {
    Name = "catalogue"
  }
}

resource "aws_route53_record" "catalogue" {
  zone_id = "Z01256903NP1ETIISC009"
  name    = "catalogue.dev.idevops25.online"
  type    = "A"
  ttl     = 15
  records = [aws_instance.catalogue.private_ip]
}