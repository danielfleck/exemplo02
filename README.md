ESQUELETO DE APLICAÇÃO PHP [![Build Status](https://travis-ci.org/danielfleck/exemplo02.png?branch=master)](https://travis-ci.org/danielfleck/exemplo02)
==========================

As alterações relativas ao modelo devem ser feitas no repositório gitolite@10.47.0.72:esqueleto-app.git. Estas são automaticamente lançadas no endereço 10.47.0.72/git-downloads/esqueleto-app.tar.gz


Alguns itens devem ser modificados por ocasião do início de um novo projeto:
----------------------------------------------------------------------------
1. Fazer uma cópia do arquivo de configuração do módulo proxyconfig:
cp vagrant/manifests/proxy_vars.pp.exemplo vagrant/manifests/proxy_vars.pp

2. Editar o arquivo vagrant/manifests/proxy_vars.pp, adicionando suas credenciais de proxy
Obs.: observe que o arquivo .gitignore na pasta vagrant/manifests impede que o arquivo contendo dados pessoais seja monitora pelo git

ORIENTAÇÕES
===========

TESTES COM PHPUNIT
------------------

* O arquivo phpunit.xml.dist gera relatório de cobertura e será usado pelo processo de build:
./bin/phpunit -c phpunit.xml.dist

* O arquivo phpunit.xml não gera relatório e será usado durante o desenvolvimento:
./bin/phpunit
