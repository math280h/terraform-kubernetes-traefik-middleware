resource "kubernetes_manifest" "default-headers-middleware" {
    manifest = {
        apiVersion = "traefik.containo.us/v1alpha1"
        kind       = "Middleware"
        metadata   = {
            name      = "default-headers"
            namespace = var.namespace
        }
        spec = {
            headers = merge({
                frameDeny            = true
                sslRedirect          = true
                browserXssFilter     = true
                contentTypeNosniff   = true
                forceSTSHeader       = true
                stsIncludeSubdomains = true
                stsPreload           = true
            }, var.default_headers)
        }
    }
}

resource "kubernetes_manifest" "forward-authentication-middleware" {
    manifest = {
        apiVersion = "traefik.containo.us/v1alpha1"
        kind       = "Middleware"
        metadata   = {
            name      = "forward-authentication"
            namespace = var.namespace
        }
        spec = {
            forwardAuth = {
                address = var.forward_auth_address
            }
        }
    }
}

resource "kubernetes_manifest" "ip-whitelist-middleware" {
    manifest = {
        apiVersion = "traefik.containo.us/v1alpha1"
        kind       = "Middleware"
        metadata   = {
            name      = "ip-whitelist"
            namespace = var.namespace
        }
        spec = {
            ipWhiteList = {
                sourceRange = var.ip_whitelist_addresses
            }
        }
    }
}

resource "kubernetes_manifest" "rate-limit-middleware" {
    manifest = {
        apiVersion = "traefik.containo.us/v1alpha1"
        kind       = "Middleware"
        metadata   = {
            name      = "rate-limit"
            namespace = var.namespace
        }
        spec = {
            rateLimit = {
                average = var.rate_limit_max_rps 
                burst   = var.rate_limit_max_burst
            }
        }
    }
}

resource "kubernetes_manifest" "redirect-regex-middleware" {
    manifest = {
        apiVersion = "traefik.containo.us/v1alpha1"
        kind       = "Middleware"
        metadata   = {
            name      = "redirect-regex"
            namespace = var.namespace
        }
        spec = {
            redirectRegex = {
                regex       = var.redirect_regex_pattern 
                replacement = var.redirect_regex_replacement
            }
        }
    }
}

resource "kubernetes_manifest" "redirect-https-middleware" {
    manifest = {
        apiVersion = "traefik.containo.us/v1alpha1"
        kind       = "Middleware"
        metadata   = {
            name      = "redirect-https"
            namespace = var.namespace
        }
        spec = {
            redirectScheme = {
                scheme    = "https"
                permanent = true
            }
        }
    }
}
