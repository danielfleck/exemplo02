#!/bin/bash
sed -i -r "/export http_proxy.*/ d" /etc/profile
sed -i -r "/export https_proxy.*/ d" /etc/profile
sed -i -r "/export ftp_proxy.*/ d" /etc/profile
sed -i -r "/export no_proxy.*/ d" /etc/profile
