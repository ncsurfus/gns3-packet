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
    description = "This is the BackBlaze KeyID in the 'App Keys' section."
}

variable "b2_application_key" {
    description = "This is the key that was provided when creating an application key in BackBlaze."
}

variable "b2_path" {
    description = "The path to the BackBlaze bucket. Example: b2://gns3-packet/test/"
}

variable "ssh_private_key" {
    description = "The SSH key used to connect to packet device, add files, and execute scripts."
}

variable "vpn_psk" {
    description = "The VPN pre-shared key."
}

variable "vpn_username" {
    description = "The VPN username."
}

variable "vpn_password" {
    description = "The VPN password."
}