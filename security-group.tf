# Create a security group for our instances. Security groups act as firewalls for our instances and help control traffic based on inbound and outbound rules.
# We need to enable SSH access to connect to our servers and HTTP/HTTPS access for deployment accessibility through the Internet.

resource "aws_security_group" "webserver_security_group" {
  name        = "dev-sg"
  description = "Enable HTTP/HTTPS access on port 80/443 and SSH access on port 22"
  vpc_id      = aws_vpc.vpc.id

  # Ingress traffic (Inbound)
  ingress {
    description = "HTTP access"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Egress traffic (Outbound)
  egress {
    from_port   = 0 # Allows all outbound traffic
    to_port     = 0
    protocol    = "-1" # Use "-1" for all protocols
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "webserver-sg" # Provide a meaningful name for the security group
  }
}