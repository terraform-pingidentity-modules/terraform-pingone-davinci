
variable "demo_environment_id" {
  type        = string
  description = "PingOne environemnt of the demo environment with DaVinci instance"
}

variable "flow_url" {
  type        = string
  description = "URL where the flow json can be retrieved"
}

variable "connections" {
  type        = list(string)
  description = "String array list of all connections linked to the flow"
}

variable "subflows" {
  type        = list(any)
  default     = []
  description = "Resource array of all subflows linked to the flow"
}

variable "all_conns" {
  type        = any
  description = "Array of all connection names and resources from the davinci-connections module output"
}
