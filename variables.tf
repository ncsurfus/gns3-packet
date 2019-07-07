variable "duckdns_token" {
    description = "The duckdns.org API token."
}

variable "duckdns_domain" {
    description = "The duckdns.org domain to update."
}

variable "packet_token" {
    description = "Your packet.net API token."
}

variable "packet_project" {
    description = "The packet.net project id. Example: 9ea63f0a-a169-45cc-9ee2-5678eacda81f"
}

variable "b2_account_id" {
    description = "The packet.net storage volume id. Example: 9ea63f0a-a169-45cc-9ee2-1234eacda81f"
}

variable "b2_application_key" {
    description = "The packet.net storage volume name. Example: volume-9ea63f0a-part1"
}

variable "b2_path" {
    description = "The packet.net storage volume name. Example: volume-9ea63f0a-part1"
}

variable "ssh_private_key" {
    description = "The SSH key used to connect to packet device, add files, and execute scripts."
}