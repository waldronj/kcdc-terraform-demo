resource "aws_instance" "private_1" {
  ami = "ami-d73818e7"
  instance_type = "t2.micro"
  subnet_id = "${aws_subnet.primary-public.id}"
  security_groups = ["${aws_security_group.node.id}"]
  availability_zone = "${aws_subnet.primary-private.availability_zone}"
  key_name = "${aws_key_pair.kcdc_terraform.key_name}"

  tags {
    Name = "private-instance-1"
  }

  connection {
    user  = "ubuntu"
    agent = true
    bastion_host = "${aws_instance.nat.public_ip}"
  }

  provisioner "remote-exec" {
    inline = "echo remote-exec works >> /tmp/remote-exec"
  }
}

resource "aws_instance" "private_2" {
  ami = "ami-d73818e7"
  instance_type = "t2.micro"
  subnet_id = "${aws_subnet.secondary-public.id}"
  security_groups = ["${aws_security_group.node.id}"]
  availability_zone = "${aws_subnet.secondary-private.availability_zone}"
  key_name = "${aws_key_pair.kcdc_terraform.key_name}"

  tags {
    Name = "private-instance-2"
  }

  connection {
    user  = "ubuntu"
    agent = true
    bastion_host = "${aws_instance.nat.public_ip}"
  }

  provisioner "remote-exec" {
    inline = "echo remote-exec works >> /tmp/remote-exec"
  }
}

resource "aws_instance" "private_3" {
  ami = "ami-d73818e7"
  instance_type = "t2.micro"
  subnet_id = "${aws_subnet.tertiary-public.id}"
  security_groups = ["${aws_security_group.node.id}"]
  availability_zone = "${aws_subnet.tertiary-private.availability_zone}"
  key_name = "${aws_key_pair.kcdc_terraform.key_name}"

  tags {
    Name = "private-instance-3"
  }

  connection {
    user  = "ubuntu"
    agent = true
    bastion_host = "${aws_instance.nat.public_ip}"
  }

  provisioner "remote-exec" {
    inline = "echo remote-exec works >> /tmp/remote-exec"
  }
}
