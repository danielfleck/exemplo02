class proxyconfig($enabled=false, $host="", $port="", $user="", $passwd="", $proxy_url="") {
	if ($enabled == true) {
		exec{ "env http proxy":
		  command => "echo \"export http_proxy=$proxy_url\" >> /etc/profile",
		  path =>    [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ],
		  require => Exec["/vagrant/modules/proxyconfig/files/rmenvproxy.sh"],
		  user => 'root'
		}
		exec{ "env https proxy":
		  command => "echo \"export https_proxy=$proxy_url\" >> /etc/profile",
		  path =>    [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ],
		  require => Exec["/vagrant/modules/proxyconfig/files/rmenvproxy.sh"],
		  user => 'root'
		}
		exec{ "env no proxy":
		  command => "echo \"export no_proxy=.parana,.local\" >> /etc/profile",
		  path =>    [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ],
		  require => Exec["/vagrant/modules/proxyconfig/files/rmenvproxy.sh"],
		  user => 'root'
		}
		exec{ "env ftp proxy":
		  command => "echo \"export ftp_proxy=$proxy_url\" >> /etc/profile",
		  path =>    [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ],
		  require => Exec["/vagrant/modules/proxyconfig/files/rmenvproxy.sh"],
		  user => 'root'
		}
		exec{ "wget http proxy":
		  command => "echo \"http_proxy = http://$host:$port\" >> /etc/wgetrc",
		  path =>    [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ],
		  require => Exec["/vagrant/modules/proxyconfig/files/rmwgetproxy.sh"],
		  user => 'root'
		}
		exec{ "wget https proxy":
		  command => "echo \"https_proxy = http://$host:$port\" >> /etc/wgetrc",
		  path =>    [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ],
		  require => Exec["/vagrant/modules/proxyconfig/files/rmwgetproxy.sh"],
		  user => 'root'
		}
		exec{ "wget ftp proxy":
		  command => "echo \"ftp_proxy = http://$host:$port\" >> /etc/wgetrc",
		  path =>    [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ],
		  require => Exec["/vagrant/modules/proxyconfig/files/rmwgetproxy.sh"],
		  user => 'root'
		}
		exec{ "wget use proxy":
		  command => "echo \"use_proxy = on\" >> /etc/wgetrc",
		  path =>    [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ],
		  require => Exec["/vagrant/modules/proxyconfig/files/rmwgetproxy.sh"],
		  user => 'root'
		}
		exec{ "wget user proxy":
		  command => "echo \"proxy_user = $user\" >> /etc/wgetrc",
		  path =>    [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ],
		  require => Exec["/vagrant/modules/proxyconfig/files/rmwgetproxy.sh"],
		  user => 'root'
		}
		exec{ "wget passwd proxy":
		  command => "echo \"proxy_passwd = $passwd\" >> /etc/wgetrc",
		  path =>    [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ],
		  require => Exec["/vagrant/modules/proxyconfig/files/rmwgetproxy.sh"],
		  user => 'root'
		}
		exec{ "git proxy":
		  command => "git config --system http.proxy \"$proxy_url\"",
		  path    => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ],
		  require => Exec["/vagrant/modules/proxyconfig/files/rmgitproxy.sh"],
		  user    => 'root'
		}
		exec{ "pear proxy":
		  command => "pear config-set http_proxy \"$proxy_url\" && pear config-set http_proxy \"$proxy_url\" system",
		  path    => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ],
		  require => Exec["pear rm proxy"],
		  user    => 'root'
		}
		exec{ "/vagrant/modules/proxyconfig/files/addaptproxy.sh":
		  command => "/vagrant/modules/proxyconfig/files/addaptproxy.sh $proxy_url",
		  require => File["/etc/apt/apt.conf"],
		}

	}
	exec{ "/vagrant/modules/proxyconfig/files/rmenvproxy.sh":
	  command => "/vagrant/modules/proxyconfig/files/rmenvproxy.sh"
	}
	exec{ "/vagrant/modules/proxyconfig/files/rmwgetproxy.sh":
	  command => "/vagrant/modules/proxyconfig/files/rmwgetproxy.sh"
	}
	exec{ "/vagrant/modules/proxyconfig/files/rmgitproxy.sh":
	  command => "/vagrant/modules/proxyconfig/files/rmgitproxy.sh",
	  returns => [ 0, 5]
	}
	exec{ "pear rm proxy":
	  command => "pear config-set http_proxy \"\" && pear config-set http_proxy \"\" system",
	  path =>    [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ],
	}
	file{ "/etc/apt/apt.conf":
	  ensure => present,
	  content => "#"
	}
}

