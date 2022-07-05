variable "provider_openstack" {
    type = object({
    user_name = string
    tenant_name = string
    password  = string
    region    = string
    auth_url  = string
  })
}

variable "linux_instance_count"{
    type = number
}

variable "windows_instance_count" {
    type = number
}

variable "all_instance_count"{
    type = number
}
variable "instance_linux" {
    type = list(object({
        name = string
        image = string
        flavor_id = string
        security_groups = list(string)
        user_data = string
    }))
}

variable "instance_windows" {
    type = list(object({
        name = string
        image = string
        flavor_id = string
        security_groups = list(string)
        user_data = string
    }))
}

variable "networks" {
    type = object({
        private_network = string
        public_network = string
    })
}

variable "volumes"{
    type = list(object({
        name = string
        size = number
    }))
}


variable "key_name" {
    type = string
}

variable "public_key"{
    type = string
}

