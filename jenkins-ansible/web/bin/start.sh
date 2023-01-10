#!/bin/bash

# Starts ssh

/usr/sbin/sshd

# Start supervisord
supervisord -n