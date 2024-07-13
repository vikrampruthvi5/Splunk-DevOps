#!/bin/bash
#The script installs Splunk, starts Splunk, enables Splunk to start on boot, creates a Splunk admin user, restarts Splunk, and opens Splunk Web in the default web browser.

# Download Splunk
wget -O splunk-9.2.2-d76edf6f0a15-Linux-x86_64.tgz "https://download.splunk.com/products/splunk/releases/9.2.2/linux/splunk-9.2.2-d76edf6f0a15-Linux-x86_64.tgz"

# Install Splunk
sudo tar -xzvf splunk-9.2.2-d76edf6f0a15-Linux-x86_64.tgz -C /opt

# Start Splunk

sudo /opt/splunk/bin/splunk start --accept-license --answer-yes --no-prompt --seed-passwd changeme

# Enable Splunk to start on boot
sudo /opt/splunk/bin/splunk enable boot-start

# Change the password to a secure password
sudo /opt/splunk/bin/splunk edit user admin -password wallBreakers_59 -role admin -auth admin:changeme

# Set new receiving port
sudo /opt/splunk/bin/splunk enable listen 9997 -auth admin:wallBreakers_59

# Restart Splunk
sudo /opt/splunk/bin/splunk restart

# Open Splunk Web
# xdg-open http://localhost:8000 

# End of the script
