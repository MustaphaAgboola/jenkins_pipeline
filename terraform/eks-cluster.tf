module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "~> 19.0"
  cluster_name    = "exam_project_app_eks_cluster"
  cluster_version = "1.24"

  cluster_endpoint_public_access = true

  vpc_id      = module.myapp.vpc_id
  subnets_ids = module.myapp.private_subnets

  tags = {
    environment = "dev"
    application = "exam_project_app"
  }

  eks_managed_node_groups = {
    dev = {
      min_size     = 1
      max_size     = 3
      desired_size = 2

      instance_types = ["t3.medium"]
    }
  }


}
