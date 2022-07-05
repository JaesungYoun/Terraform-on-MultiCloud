variable "provider_gcp"{
    type = object({
        project = string
        credentials = string
        zone = string
    })

}


variable instance_count{
    type = number
}

variable "instance"{
    type = list(object({
        name = string
        machine_type = string
        image = string
        email = string
    }))

}

variable "network" {
    type = string
}