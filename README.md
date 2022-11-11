# terraform-kubernetes-traefik-middleware

A simple collection of easy to use middlewares for traefik implemented in terraform.

## Middlewares
When using this module, the following middlewares will be created - Keep in mind you must still apply them to the routes you want them on.

| Name | Description |
|---|---|
| default-headers | Applies headers to all requests  |
| forward-authentication  | Allows you to forward a request for authentication before proxying  |
| ip-whitelist  | Simple IP Whitelist  |
| rate-limit  | Simple Rate Limit on HTTP Requests |
| redirect-regex  | Allows you to redirect requests based on regex pattern  |
| redirect-https | Automatically redirects requests to https  |
