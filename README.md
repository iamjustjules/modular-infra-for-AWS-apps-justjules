# modular-infra-for-AWS-apps-justjules
a resilient, secure, and highly available infrastructure for deploying applications on AWS

# Pipeline Plumbers Infrastructure Deployment with Terraform
This project uses Terraform to create and manage a scalable AWS infrastructure for the "Pipeline Plumbers" application. It includes VPC, subnets, internet gateway, NAT gateway, route tables, security groups, a launch template, load balancer, target group, autoscaling group, and WAF setup, supporting a highly available, secure, and cost-effective cloud environment.
Overview
Each component serves to be flexible and modular. This is for an organization looking to deploy an application that balances security, scalability, and operational efficiency. 
1. Provider Configuration (“00-auth.tf”)
This defines the AWS provider and specifies the AWS region (“us-east-1”) where resources will be created. It also sets the required provider version, ensuring compatibility with Terraform 3.x.
2. VPC Configuration (“01-vpc.tf”)
The VPC is the network boundary for resources, with a CIDR block of “10.100.0.0/16”. This IP range provides space for subnets, keeping IP addresses private within the cloud environment and allowing secure and isolated networking.
3. Subnet Configuration (“02-subnets.tf”)
This defines the public and private subnets within different availability zones to ensure high availability. Public subnets (“10.100.11.0/24”, “10.100.12.0/24”, “10.100.13.0/24”) allow resources to be accessed from the internet. Private subnets (“10.100.111.0/24”, “10.100.112.0/24”, “10.100.113.0/24”) restrict internet access and house internal services, increasing security.
4. Internet Gateway (“03-igw.tf”)
This provides internet access for the resources in public subnets, enabling external connectivity to load balancers and other public-facing services.
5. NAT Gateway and Elastic IP (“04-nat.tf”)
This lets instances in private subnets connect to the internet for updates or external communication while keeping them secure from incoming traffic. An Elastic IP is assigned to the NAT Gateway to maintain a stable IP address.
6. Route Tables (“05-route.tf”)
This directs network traffic within the VPC. The public route table routes internet-bound traffic from public subnets through the Internet Gateway, while the private route table routes external requests from private subnets through the NAT Gateway.
7. Security Group (“06-sg01-all.tf”)
This controls inbound and outbound traffic for instances within the VPC, allowing internal communication (“10.100.0.0/16” and space for “10.101.0.0/16”) and egress to the internet.
8. Launch Template (“07-launchtemplate.tf”)
This specifies the configuration for EC2 instances, including instance type, AMI ID, and security groups. This template is reused by the Autoscaling Group to ensure consistent instance configurations.
9. Target Group (“08-targetgroup.tf”)
This manages how traffic is distributed to the instances. Health checks ensure that only healthy instances receive traffic.
10. Load Balancer (“09-loadbalancer.tf”)
This distributes incoming application traffic across multiple targets (EC2 instances in this scenario), ensuring high availability and improved fault tolerance.
11. Autoscaling Group (“10-autoscalinggroup.tf”)
This uses the launch template to manage EC2 instances, automatically scaling them up or down based on demand. This ensures the application can handle varying traffic loads efficiently.
12. Key Pair (“11-key.tf”)
This creates an SSH key pair for secure access to EC2 instances. 
13. Web Application Firewall (WAF) (“13-waf.tf”)
This protects the application from common web-based attacks using AWS-managed rule sets, improving security.
Interaction and Utility
Together, these resources create a resilient, secure, and available infrastructure for deploying applications on AWS. The VPC provides network isolation, while subnets separate public and private traffic. The NAT gateway enables private subnet internet access without exposing resources. Security groups and WAF control traffic, while the load balancer and autoscaling ensure scalability and availability.
This is useful for any organization deploying critical applications, as it:
1. Reduces Downtime: Autoscaling and load balancing ensure applications can handle high traffic loads.
2. Enhances Security: The private subnets, security groups, and WAF minimize vulnerability exposure.
3. Improves Resource Management: This setup allows efficient use of resources with NAT gateway and private/public subnet segmentation.
