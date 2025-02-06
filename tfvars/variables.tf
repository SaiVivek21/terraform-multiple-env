variable "project"{
    default = "expense"

}
variable "environment"{

}
variable "instances" {
   default = ["mysql-dev","backend-dev","frontend-dev"]
}

variable "zone_id" {
    default = "Z021448929NMXW4P65UQE"
}

variable "domain_name" {
    default = "basam.site"
}

variable "common_tags" {
    type = map
    default = {
        Project = "expense"
    }
}