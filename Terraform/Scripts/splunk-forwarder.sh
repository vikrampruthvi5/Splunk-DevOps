#!/bin/bash

# set master variable from 1st argument
master=$1
echo "Master Public IP: $master"

# Create splunkfwd user
sudo useradd -m splunkfwd

# Start Splunk Forwarder
wget -O splunkforwarder-9.2.2-d76edf6f0a15-Linux-x86_64.tgz "https://download.splunk.com/products/universalforwarder/releases/9.2.2/linux/splunkforwarder-9.2.2-d76edf6f0a15-Linux-x86_64.tgz"

# Install Splunk Forwarder
sudo tar xzvf splunkforwarder-9.2.2-d76edf6f0a15-Linux-x86_64.tgz -C /opt
sudo chown -R splunkfwd:splunkfwd /opt/splunkforwarder/

# Start Splunk Forwarder
sudo /opt/splunkforwarder/bin/splunk start --accept-license --answer-yes --no-prompt --seed-passwd wallBreakers_59

# Stop Splunk Forwarder
sudo /opt/splunkforwarder/bin/splunk stop

# Add Splunk Forwarder to boot
sudo /opt/splunkforwarder/bin/splunk enable boot-start

# Start Splunk Forwarder
sudo /opt/splunkforwarder/bin/splunk start

# Add master to forward data to
sudo /opt/splunkforwarder/bin/splunk add forward-server $master:9997 --no-prompt -auth admin:wallBreakers_59


# Add monitor
sudo /opt/splunkforwarder/bin/splunk add monitor /var/log

# Restart Splunk Forwarder
sudo /opt/splunkforwarder/bin/splunk restart

# End of the script