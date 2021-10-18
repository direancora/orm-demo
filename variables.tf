### Common ###


### MDC - 18 Oct 2021 to fix shape

variable "tenancy_ocid" {}
variable "region" {}


### Network ###


variable "compartment_of_vcns" {}

variable "compartment_specific_vcn" {}

### Compute ###

variable "compute_compartment" {}

## variable "subnet_compartment" {}

variable "selected_subnet" {}
      
variable "use_existing_vcn" {
  type    = bool
  default = true
}


variable "resource_tags" {

  type = map
  
}


variable "public_ssh_key" {
  default = ""
}

variable "demo_compute_instance_display_name" {
  
  default = "DEV_FFNS_TOMCAT_01_AS"

}

variable "demo_compute_instance_shape" {
  
##  default = "VM.Standard2.1"

  default = "VM.Standard2.2"
}

variable "demo_operating_system" {
  
  default = "Oracle Linux"

}
variable "demo_operating_system_version" {
  
    default = "7.9"
}

variable "demo_compute_instance_vnic_display_name" {
  
  default = "DEV_FFNS_TOMCAT_01_AS_VNIC_P"
}

variable "demo_compute_instance_hostname_dns_label" {
  
  default = "dev-ffns-tomcat-01"

}

variable "demo_compute_add_public_ip" {
  
  type    = bool
  default = true

}





