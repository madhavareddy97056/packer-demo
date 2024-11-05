source "amazon-ebs" "source-demo" {
    region = "ap-south-1"
    instance_type            = "t2.micro"
    source_ami  = "ami-0dee22c13ea7a9a67"
     ssh_username             = "ubuntu"
     ami_name                 = "my-packer-ami-{{timestamp}}"
  ami_description          = "AMI created with Packer"
}

build {
  sources = ["source.amazon-ebs.source-demo"]

  provisioner "shell" {
    inline = [
      "sudo apt update -y",
      "sudo apt install -y apache2",
      "sudo systemctl enable apache2",
      "sudo systemctl start apache2"
    ]
  }
}
