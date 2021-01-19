#!/bin/sh

if [ `id -u` -eq 0 ]
then
  echo "Install RFLinkGateway ..."
  cp RFLinkGateway.service /etc/init.d/RFLinkGateway.service
  chmod +x /etc/init.d/RFLinkGateway.service

  mkdir /usr/local/libexec
  mkdir /usr/local/libexec/RFLinkGateway
  
  cp MQTTClient.py /usr/local/libexec/RFLinkGateway/MQTTClient.py
  cp Processors.py /usr/local/libexec/RFLinkGateway/Processors.py
  cp RFLinkGateway.py /usr/local/libexec/RFLinkGateway/RFLinkGateway.py
  cp RangeDict.py /usr/local/libexec/RFLinkGateway/RangeDict.py
  cp SerialProcess.py /usr/local/libexec/RFLinkGateway/SerialProcess.py
  cp config.json /usr/local/libexec/RFLinkGateway/config.json

  chmod +x /usr/local/libexec/RFLinkGateway/RFLinkGateway.py

  update-rc.d RFLinkGateway.service defaults && invoke-rc.d RFLinkGateway.service start  
  
  echo "RFLinkGateway installed."
else
  echo "You need to be ROOT (sudo can be used)"
fi
