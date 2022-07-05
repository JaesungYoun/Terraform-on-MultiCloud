variable provider_ncp{
    type = object({
        access_key  = string
        secret_key  = string
        region      = string
        support_vpc = string

    })
}

variable server_count {
    type = number
}

variable server {
    type = list(object({
        name = string
        os = string
    }))
}

variable init_script {
    type = list(object({
        name = string
        content = string
        os_type = string
    }))
}


variable vpc {
    type = object({
        name = string
        vpc_ip = string
    })
}
variable subnet {
    type = object({
        name = string
        subnet_ip = string
    })
}

variable login_key_name {
    type = string
}