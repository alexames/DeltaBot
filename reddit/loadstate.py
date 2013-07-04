#!/usr/bin/env python
import os
import paramiko
import sys

"""
   This script is used to load database states of the local reddit instance.
"""

assert len(sys.argv) >= 2, 'Please pass the name of the state to load.'

client = paramiko.SSHClient()
client.set_missing_host_key_policy(paramiko.AutoAddPolicy())
client.connect('127.0.0.1', port=2222, username='vagrant', password='vagrant')

state_file_name = '/vagrant/states/%s.sql' % sys.argv[1]

cmd             = 'sudo -u postgres psql -d reddit -f %s' % state_file_name

print cmd

_, _, c = client.exec_command(cmd)

line = c.readline()
while line:
    sys.stdout.write(line)
    line = c.readline()
