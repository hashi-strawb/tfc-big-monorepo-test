variable "length" {
  default = 3
}

variable "prefix" {
  default = null
}

variable "separator" {
  default = "-"
}

resource "random_pet" "pet" {
  length    = var.length
  prefix    = var.prefix
  separator = var.separator
}

output "pet" {
  value = random_pet.pet.id
}
