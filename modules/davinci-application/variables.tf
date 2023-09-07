variable "flows" {
  type = list(object({
    name = string
    id   = string
  }))
}
variable "app_name" {
  type = string
}

variable "demo_environment_id" {
  type = string
}
