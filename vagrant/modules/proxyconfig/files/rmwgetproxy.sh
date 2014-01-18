#!/bin/bash
sed -i -r "/http_proxy.*/ d" /etc/wgetrc
sed -i -r "/https_proxy.*/ d" /etc/wgetrc
sed -i -r "/ftp_proxy.*/ d" /etc/wgetrc
sed -i -r "/use_proxy.*/ d" /etc/wgetrc
sed -i -r "/proxy_user.*/ d" /etc/wgetrc
sed -i -r "/proxy_passwd.*/ d" /etc/wgetrc
