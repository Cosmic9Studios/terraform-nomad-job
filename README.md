# terraform-nomad-job
A terraform module to run nomad jobs

# MUST HAVES
    * Nomad Server

# How to use

variables: 
    address = The nomad uri (Ex: https://url:4646)
    file_path = The path to the .nomad or .hcl template to deploy
    var = Variables to pass to the template