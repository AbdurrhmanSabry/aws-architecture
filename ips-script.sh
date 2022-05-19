#!/bin/bash
sed -i 's#.*ansible_host.*#ansible_host: ${terraform -chdir=./terraform  output -raw puplic-ip-ec2 }#' ./ansible/group_vars/proxy.yaml
sed -i 's#HostName.*#HostName ${terraform -chdir=./terraform  output -raw puplic-ip-ec2}#' /var/jenkins_home/.ssh/config
sed -i 's#.*ansible_host.*#ansible_host: ${terraform -chdir=./terraform output -raw private-ec2-ip}#' ./ansible/group_vars/slaves.yaml
sed -i 's#proxy_pass.*#proxy_pass http://${terraform -chdir=./terraform output -raw private-ec2-ip}:3000;#' ./ansible/files/nginx.conf
