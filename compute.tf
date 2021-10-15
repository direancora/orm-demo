// Copyright (c) 2017, 2021, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Mozilla Public License v2.0

####
##  Configure OCI Environment for DEMO 
###
###     Create and configure a compute instance for either Tomcat or Jetty


resource "oci_core_instance" "demo_ui" {

  availability_domain = data.oci_identity_availability_domain.ad.name
  compartment_id      = var.compute_compartment
  display_name        = var.demo_compute_instance_display_name
  shape               = var.demo_compute_instance_shape

  defined_tags   = var.resource_tags.definedTags
  freeform_tags  = var.resource_tags.freeformTags

  create_vnic_details {
  
    subnet_id         = var.selected_subnet
  
    display_name      = var.demo_compute_instance_vnic_display_name

    hostname_label    = var.demo_compute_instance_hostname_dns_label
   
    assign_public_ip  = var.demo_compute_add_public_ip

    defined_tags   = var.resource_tags.definedTags
    freeform_tags  = var.resource_tags.freeformTags    

  }


  source_details {
    source_id   = data.oci_core_images.demo_ui.images.0.id
    source_type = "image"
  }


 metadata = {
    ssh_authorized_keys = var.public_ssh_key
  }

  timeouts {
    create = "60m"
  }
}


###
## Lookup image based upon filter below
###

data "oci_core_images" "demo_ui" {
    compartment_id = var.compute_compartment

    operating_system = var.demo_operating_system
    operating_system_version = var.demo_operating_system_version

  filter {
    name = "display_name"
    values = ["^([a-zA-z]+)-([a-zA-z]+)-([\\.0-9]+)-([\\.0-9-]+)$"]
    regex = true
  }
}


# Gets a list of Availability Domains
data "oci_identity_availability_domain" "ad" {
  compartment_id = var.tenancy_ocid
  ad_number      = 1
}



###
# Outputs
###

output "ui_display_name" {
  value = oci_core_instance.demo_ui.display_name
}

output "ui_public_ip" {
  value = oci_core_instance.demo_ui.public_ip
}


