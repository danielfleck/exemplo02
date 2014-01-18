import "proxy_vars.pp"

#################################################################################
# Configurações de proxy ########################################################
#################################################################################
# As variaveis relativas ao proxy devem ser definidas em um arquivo             #
# chamado "proxy_vars.pp". Basta copiar o exemplo "proxy.pp.exemplo" para       #
# "proxy.pp" e configurar os valores.                                           #
#################################################################################

class{'proxyconfig':
  enabled   => $proxy_enabled,
  host      => $proxy_host,
  port      => $proxy_port,
  user      => $proxy_user,
  passwd    => $proxy_passwd,
  proxy_url => $proxy_url,
  before    => Exec["atualiza"],
}

exec{"atualiza":
  command => "apt-get update -y",
  environment => ["http_proxy=\"$proxy_url\"","https_proxy=\"$proxy_url\"","ftp_proxy=\"$proxy_url\""],
  path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ],
  user => "root",
}

