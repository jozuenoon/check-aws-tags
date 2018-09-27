#!/bin/bash -x

function check_tags {
aws ec2 describe-instances --region $(curl -m 10 http://169.254.169.254/latest/dynamic/instance-identity/document|grep region|awk -F\" '{print $4}') --instance-ids $(curl -m 10 http://169.254.169.254/latest/meta-data/instance-id) | grep KubernetesCluster
}

until check_tags
do 
  sleep 1s 
  echo no tags 
done
sleep 1s
echo FINISH!