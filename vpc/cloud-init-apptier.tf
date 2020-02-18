data "template_cloudinit_config" "cloud-init-apptier" {
  base64_encode = false
  gzip          = false

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
