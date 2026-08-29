variable "app_name" {
  description = "The name for the application."
  type        = string
  default     = "xomappetit"
}

variable "domain_suffix" {
  description = "Suffix for the domain of the app."
  type        = string
  default     = ".xomware.com"
}

variable "aws_region" {
  description = "AWS region for resources"
  type        = string
  default     = "us-east-1"
}

variable "api_secret_key" {
  description = "API Secret Key for authorizer"
  type        = string
  sensitive   = true
}

variable "anthropic_api_key" {
  description = "Anthropic API key for the recipe-importer Lambdas (Claude Messages API). Wired in from the org secret DEV_ANTHROPIC_API_KEY via TF_VAR_anthropic_api_key."
  type        = string
  sensitive   = true
  default     = ""
}

# CloudFront Variables
variable "cloudfront_origin_path" {
  type    = string
  default = ""
}

variable "us_canada_only" {
  type    = bool
  default = true
}

variable "custom_error_response_page_path" {
  type    = string
  default = "/index.html"
}

variable "retain_on_delete" {
  type    = bool
  default = false
}

variable "minimum_tls_version" {
  type    = string
  default = "TLSv1.2_2018"
}

variable "enable_cloudfront_cache" {
  type    = bool
  default = true
}

# Lambda Variables
variable "lambda_runtime" {
  description = "Runtime for Lambda functions"
  type        = string
  default     = "nodejs20.x"
}

variable "lambda_trace_mode" {
  description = "X-Ray tracing mode for Lambda"
  type        = string
  default     = "Active"
}

variable "lambda_memory_size" {
  description = "Memory size for Lambda functions in MB"
  type        = number
  default     = 256
}

variable "lambda_timeout" {
  description = "Timeout for Lambda functions in seconds"
  type        = number
  default     = 30
}

# Read these off the repo, never build them from a name:
#   gh api /repos/<org>/<repo>/actions/oidc/customization/sub -q .sub_claim_prefix
# GitHub uses immutable numeric identifiers on newer repos, and it reports the
# repo's CURRENT name -- several Xomware repos have been renamed since creation.
# Both spellings are listed so a flip in either direction keeps working.

variable "github_frontend_subjects" {
  description = "OIDC subject prefixes allowed to assume the frontend deploy role"
  type        = list(string)
  default = [
    "repo:Xomware/xomappetit-frontend",
  ]
}

variable "github_backend_subjects" {
  description = "OIDC subject prefixes allowed to assume the backend deploy role"
  type        = list(string)
  default = [
    "repo:Xomware/xomappetit-backend",
  ]
}

variable "github_infrastructure_subjects" {
  description = "OIDC subject prefixes for this infrastructure repository"
  type        = list(string)
  default = [
    "repo:Xomware/xomappetit-infrastructure",
  ]
}

variable "default_branch" {
  description = "Branch a push to which is allowed to run terraform apply"
  type        = string
  default     = "main"
}
