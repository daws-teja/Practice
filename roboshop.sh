#!/bin/bash

AMI_ID="ami-0220d79f3f480ecf5"
SG_ID="sg-060b4fb9a7c4378d1"


for INSTANCE in "$@"
do 
    INSTANCE_ID=$( aws ec2 run-instances \
      --image-id $AMI_ID \
      --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$INSTANCE}]" \
      --instance-type t3.micro \
      --security-group-ids $SG_ID \
      --query 'Instances[0].InstanceId' \
      --output text
    )

    if [ "$INSTANCE" == "frontend" ]; then

        IP=$(
                aws ec2 describe-instances \
                --instance-ids $INSTANCE_ID \
                --query 'Reservations[].Instances[].PublicIpAddress' \
                --output text

            )
        echo "Public IP Adress OF $INSTANCE is : $IP"

    else 
        IP=$(
                aws ec2 describe-instances \
                --instance-ids $INSTANCE_ID \
                --query 'Reservations[].Instances[].PrivateIpAddress' \
                --output text

            )
        echo "Private IP Adress of $INSTANCE is : $IP"

    fi

done

