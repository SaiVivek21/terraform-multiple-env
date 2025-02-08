variable "project"{
    default = "expense"

}
variable "environment"{

}
variable "instances" {
   default = ["mysql-dev","backend-dev","frontend-dev"]
}

variable "zone_id" {
    default = "Z082073638K70HX4JZ6A8"

}

variable "domain_name" {
    default = "basam.site"
}

variable "common_tags" {
    type = map
    default = {
        Project = "expense"
        terraform = "true"
    }
}