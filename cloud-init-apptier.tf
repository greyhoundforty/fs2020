data "template_cloudinit_config" "cloud-init-apptier" {
  base64_encode = false
  gzip = false
  part {
    content = <<EOF
#cloud-config
package_update: true
package_upgrade: true
users:
  - name: ryan
    groups: [ sudo ]
    sudo: [ "ALL=(ALL) NOPASSWD:ALL" ]
    shell: /bin/bash
    ssh-authorized-keys:
    - 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC4lY4YcpVi2KaH2xMzXCRbJ0S/PztQMlUHoCKTIjWEybREpfntD0hhaaKIUw8UUR4324mA5JVpBzlGyMusKFlVmbaMjkfNZpUyqR4OW4zcTEXXnowbD6FZpfMejPJl9WLD5Pmt88TM4NfqOhsqmInXj3X6iBpBdZ94bWLfFrNOYNqCInL3t91Ks3DHbD8MbwMJ4itPb6m3RAEkvVc1ImEo9NVpMKuSbyjbiQTuDHsLajCGOI6tf4IgZw2MIq9QnfklhxHfswTfjpN3hVhJgAtSwjbicXzn0gKGoxQvqK0mLtzMMe0/12pspT7b7Pwg6Boygat1PS1CryHJmCfdy0xf ryan@Ryans-MacBook-Pro.local'
    - 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDxcx9wbVCHjxyJxZwho+o2TnvkBPk/IifoJfAcLbgtO7QAI8EWB2p4eDtlPo2zAoTfSPS9TiCUUffBcXwpFLKLR2vvht5+Me4pozqTl9fDbWOWmfNWN8dLHR1oruZm+kYLL0CPt99KHXtYQnxsYfFzu37ZVOrzT6MNzfk7aYwojDOni6jt9F+HjdXr+6d4QUjBVRmdUAUcxUjgCh1efj7Q6NAXOFUP/oAHRJsfmYKLH3YvsjFy7OT67DSDoMEldHHOL9EWmQcQtOLY+H/HJYl+87jINJ4AZB5D4Tozi7QLN6tvoIhTPZHwWAyg4HasE3VFjwBlIunEnFkmMxolJfLp ryan@hyperion.local'
    - 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDGps4bNYLE9NitCKsZuSEk7OUli7EBs/BvTHXgAKN6Ec9/BqVHBcbvhBRmGaRi5cvVYu5qo4zSegMlcAfqZ2mijI3vm9GQi+0RkvvIMWO5j2MmRaaTjjOAZRSvPvKNhOJ1O47OCYSr1hozW+7l4zVPUPw4rqugQETBb2nU2CXnY2naCll+T/JE+vkAswICSZl1PJwkUyxyGRIsey1m3VPSlYHVAhKAYDXpWgvI7QHE7m+dydroZNzgdBdQ93KgL3k/wU7OwJVy4WR1lOTcg4yN3Lsb1zUsUg8EgAwaW9ytl9OlVdId04yM1t4iTaBQ63aO/OKD+2fQWILPtJjasWap ryan@tycho.local'
packages:
    - python
    - python-apt
    - python3-apt
    - nginx
final_message: "The system is finally up, after $UPTIME seconds"
output: {all: '| tee -a /var/log/cloud-init-output.log'}
EOF
  }
}