terraform {
  # The latest version of Terragrunt (v0.19.0 and above) requires Terraform 0.12.0 or above.
  required_version = ">= 0.12.0"
}

provider "nomad" {
  address = var.address
}

data "template_file" "job" {
  template = "${file(var.file_path)}"
  vars = var.vars
}

# Register a job
resource "nomad_job" "job" {
  jobspec = "${data.template_file.job.rendered}"
}