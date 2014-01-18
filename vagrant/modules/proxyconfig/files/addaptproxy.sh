#!/bin/bash
proxy_url=$1
echo "Acquire::http::proxy \"$proxy_url\";"  >  /etc/apt/apt.conf
echo "Acquire::https::proxy \"$proxy_url\";" >> /etc/apt/apt.conf
echo "Acquire::ftp::proxy \"$proxy_url\";"   >> /etc/apt/apt.conf
