variable namespace {
  type        = string
  default     = "default"
  description = "namespace"
}

variable default_headers {
  type        = object
  default     = {}
  description = "Headers for default-headers, can be used to overwrite defaults"
}

variable forward_auth_address {
    type        = string
    default     = ""
    description = "Address for forward-authentication middleware"
}

variable ip_whitelist_addresses {
  type        = list
  default     = []
  description = "List of whitelisted addreses"
}

variable rate_limit_max_rps {
  type        = number
  default     = 500
  description = "the maximum rate, by default in requests per second, allowed from a given source."
}

variable rate_limit_max_burst {
  type        = number
  default     = 100
  description = "the maximum number of requests allowed to go through in the same arbitrarily small period of time."
}

variable redirect_regex_pattern {
  type        = string
  default     = "(.*)"
  description = "regular expression to match and capture elements from the request URL."
}

variable redirect_regex_pattern {
  type        = string
  default     = "${1}"
  description = "defines how to modify the URL to have the new target URL."
}
