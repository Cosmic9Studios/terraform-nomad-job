terraform {
  # The latest version of Terragrunt (v0.19.0 and above) requires Terraform 0.12.0 or above.
  required_version = ">= 0.12.0"
}

provider "nomad" {
  address = var.address
}

data "template_file" "job" {
    count = var.address == "" ? 0 : length(var.data)
    template = "${file(var.data[count.index].file_path)}"
    vars = var.data[count.index].vars
}

# Register a job
resource "nomad_job" "job" {
    count = var.address == "" ? 0 : length(var.data)
    jobspec = "${data.template_file.job[count.index].rendered}"
    depends_on = [var.nomad_depends_on]
}