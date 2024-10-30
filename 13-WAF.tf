
resource "aws_wafv2_web_acl" "pipeline_plumbers_acl" {
  name        = "pipeline-plumbers-web-acl"
  scope       = "REGIONAL"
  description = "WAF for pipeline-plumbers application"

  default_action {
    allow {}
  }

  rule {
    name     = "AWSManagedRulesCommonRuleSet"
    priority = 1

    override_action {
      none {}
    }

    statement {
      managed_rule_group_statement {
        name        = "AWSManagedRulesCommonRuleSet"
        vendor_name = "AWS"
      }
    }

    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "commonRuleSet"
      sampled_requests_enabled   = true
    }
  }

  visibility_config {
    cloudwatch_metrics_enabled = true
    metric_name                = "pipeline-plumbers-web-acl"
    sampled_requests_enabled   = true
  }
}
