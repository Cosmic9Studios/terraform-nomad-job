variable "address" {
    type = string
}

variable "data" {
    type = list(object({
        file_path = string
        vars = map(string)
    }))
}

variable "nomad_depends_on" {
    default = []
}